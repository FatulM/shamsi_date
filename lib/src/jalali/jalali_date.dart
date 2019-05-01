library jalali_date;

import 'package:shamsi_date/src/date.dart';
import 'package:shamsi_date/src/gregorian/gregorian_date.dart';
import 'package:shamsi_date/src/jalali/jalali_formatter.dart';

/// Jalali (Shamsi or Persian) Date class
class Jalali implements Date, Comparable<Jalali> {
  /// Jalali year (1 to 3100)
  @override
  final int year;

  /// Jalali month (1 to 12)
  @override
  final int month;

  /// Jalali day (1 to 29/31)
  @override
  final int day;

  /// Converts a date of the Jalali calendar to the Julian Day number.
  @override
  int get julianDayNumber {
    final r = _JalaliCalculation.calculate(year);

    return Gregorian(r.gy, 3, r.march).julianDayNumber +
        (month - 1) * 31 -
        (month ~/ 7) * (month - 7) +
        day -
        1;
  }

  /// Week day number
  /// [Shanbe] = 1
  /// [Jomee]  = 7
  @override
  int get weekDay => (julianDayNumber + 2) % 7 + 1;

  /// Formatter for this date object
  @override
  JalaliFormatter get formatter => JalaliFormatter(this);

  /// Create a Jalali date by using year, month and day
  /// year and month default to 1
  Jalali(this.year, [this.month = 1, this.day = 1]);

  /// Converts the Julian Day number to a date in the Jalali calendar.
  factory Jalali.fromJulianDayNumber(julianDayNumber) {
    // Calculate Gregorian year (gy).
    int gy = Gregorian.fromJulianDayNumber(julianDayNumber).year;
    int jy = gy - 621;
    final r = _JalaliCalculation.calculate(jy);
    int jdn1f = Gregorian(gy, 3, r.march).julianDayNumber;
    int jd, jm, k;

    // Find number of days that passed since 1 Farvardin.
    k = julianDayNumber - jdn1f;
    if (k >= 0) {
      if (k <= 185) {
        // The first 6 months.
        jm = 1 + (k ~/ 31);
        jd = (k % 31) + 1;

        return Jalali(jy, jm, jd);
      } else {
        // The remaining months.
        k -= 186;
      }
    } else {
      // Previous Jalali year.
      jy -= 1;
      k += 179;
      if (r.leap == 1) k += 1;
    }
    jm = 7 + (k ~/ 30);
    jd = (k % 30) + 1;

    return Jalali(jy, jm, jd);
  }

  /// Create a Jalali date by using [DateTime] object
  factory Jalali.fromDateTime(DateTime dateTime) {
    return Gregorian.fromDateTime(dateTime).toJalali();
  }

  /// Create a Jalali date from Gregorian date
  factory Jalali.fromGregorian(Gregorian date) {
    return Jalali.fromJulianDayNumber(date.julianDayNumber);
  }

  /// Get Jalali date for now
  factory Jalali.now() {
    return Jalali.fromDateTime(DateTime.now());
  }

  /// Converts Jalali date to [DateTime] object
  DateTime toDateTime() {
    return toGregorian().toDateTime();
  }

  /// Converts a Jalali date to Gregorian.
  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(julianDayNumber);
  }

  /// Checks whether a Jalali date is valid or not.
  bool isValid() {
    return year >= -61 &&
        year <= 3177 &&
        month >= 1 &&
        month <= 12 &&
        day >= 1 &&
        day <= monthLength;
  }

  /// Checks if a year is a leap year or not.
  bool isLeapYear() {
    return _JalaliCalculation.calculate(year).leap == 0;
  }

  /// Computes number of days in a given month in a Jalali year.
  int get monthLength {
    if (month <= 6) return 31;
    if (month <= 11) return 30;
    if (isLeapYear()) return 30;
    return 29;
  }

  /// Default string representation: `YYYY/MM/DD`
  @override
  String toString() {
    return '$year/$month/$day';
  }

  /// Compare dates
  @override
  int compareTo(Jalali other) {
    if (year != other.year) {
      return year > other.year ? 1 : -1;
    }

    if (month != other.month) {
      return month > other.month ? 1 : -1;
    }

    if (day != other.day) {
      return day > other.day ? 1 : -1;
    }

    return 0;
  }

  /// bigger than operator
  bool operator >(Jalali other) {
    return compareTo(other) > 0;
  }

  /// bigger than or equal operator
  bool operator >=(Jalali other) {
    return compareTo(other) >= 0;
  }

  /// less than operator
  bool operator <(Jalali other) {
    return compareTo(other) < 0;
  }

  /// less than or equal operator
  bool operator <=(Jalali other) {
    return compareTo(other) <= 0;
  }

  /// equals operator
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Jalali &&
            runtimeType == other.runtimeType &&
            year == other.year &&
            month == other.month &&
            day == other.day;
  }

  /// hashcode operator
  @override
  int get hashCode {
    return year.hashCode ^ month.hashCode ^ day.hashCode;
  }
}

/// Internal class
class _JalaliCalculation {
  /// Number of years since the last leap year (0 to 4)
  final int leap;

  /// Gregorian year of the beginning of Jalali year
  final int gy;

  /// The March day of Farvardin the 1st (1st day of jy)
  final int march;

  _JalaliCalculation({this.leap, this.gy, this.march});

  /// This determines if the Jalali (Persian) year is
  /// leap (366-day long) or is the common year (365 days), and
  /// finds the day in March (Gregorian calendar) of the first
  /// day of the Jalali year (jy).
  ///
  /// [1. see here](http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm)
  ///
  /// [2. see here](http://www.fourmilab.ch/documents/calendar/)
  factory _JalaliCalculation.calculate(int jy) {
    // Jalali years starting the 33-year rule.
    final List<int> breaks = [
      -61,
      9,
      38,
      199,
      426,
      686,
      756,
      818,
      1111,
      1181,
      1210,
      1635,
      2060,
      2097,
      2192,
      2262,
      2324,
      2394,
      2456,
      3178
    ];

    int bl = breaks.length,
        gy = jy + 621,
        leapJ = -14,
        jp = breaks[0],
        jm,
        jump,
        leap,
        leapG,
        march,
        n,
        i;

    if (jy < jp || jy >= breaks[bl - 1]) {
      throw 'Invalid Jalali year $jy';
    }

    // Find the limiting years for the Jalali year jy.
    for (i = 1; i < bl; i += 1) {
      jm = breaks[i];
      jump = jm - jp;
      if (jy < jm) {
        break;
      }
      leapJ = leapJ + (jump ~/ 33) * 8 + (((jump % 33)) ~/ 4);
      jp = jm;
    }
    n = jy - jp;

    // Find the number of leap years from AD 621 to the beginning
    // of the current Jalali year in the Persian calendar.
    leapJ = leapJ + ((n) ~/ 33) * 8 + (((n % 33) + 3) ~/ 4);
    if ((jump % 33) == 4 && jump - n == 4) {
      leapJ += 1;
    }

    // And the same in the Gregorian calendar (until the year gy).
    leapG = ((gy) ~/ 4) - (((((gy) ~/ 100) + 1) * 3) ~/ 4) - 150;

    // Determine the Gregorian date of Farvardin the 1st.
    march = 20 + leapJ - leapG;

    // Find how many years have passed since the last leap year.
    if (jump - n < 6) {
      n = n - jump + ((jump + 4) ~/ 33) * 33;
    }
    leap = ((((n + 1) % 33) - 1) % 4);
    if (leap == -1) {
      leap = 4;
    }

    return _JalaliCalculation(leap: leap, gy: gy, march: march);
  }
}
