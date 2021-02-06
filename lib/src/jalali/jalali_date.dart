// Copyright 2018 - 2021, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library jalali_date;

import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_date.dart';
import '../jalali/jalali_formatter.dart';

/// Jalali (Jalaali, Shamsi or Persian) Date class
class Jalali implements Date, Comparable<Jalali> {
  /// Minimum computable Jalali date
  ///
  /// equivalent to Gregorian(560,3,20) and Jalali(-61,1,1)
  /// and julian day number of 1925675
  static final Jalali min = Jalali(-61, 1, 1);

  /// Maximum computable Jalali date
  ///
  /// equivalent to Gregorian(3798,12,31) and Jalali(3177,10,11)
  /// and julian day number of 3108616
  static final Jalali max = Jalali(3177, 10, 11);

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
  int get weekDay {
    return (julianDayNumber + 2) % 7 + 1;
  }

  /// Computes number of days in a given month in a Jalali year.
  @override
  int get monthLength {
    if (month <= 6) {
      return 31;
    } else if (month <= 11) {
      return 30;
    } else {
      // month == 12
      return isLeapYear() ? 30 : 29;
    }
  }

  /// Formatter for this date object
  @override
  JalaliFormatter get formatter {
    return JalaliFormatter(this);
  }

  /// Create a Gregorian date by using [year], [month] and [day]
  ///
  /// year and month default to 1
  Jalali(final int year, [final int month = 1, final int day = 1])
      : year = year,
        month = month,
        day = day {
    // should be between: Jalali(-61, 1, 1) and Jalali(3177, 10, 11)
    if (year < -61 || year > 3177) {
      throw DateException('Jalali date is out of computable range.');
    }

    if (month < 1 || month > 12) {
      throw DateException('Jalali month is out of valid range.');
    }

    // monthLength is very cheap
    // but isLeapYear is not cheap
    // if month is 12, monthLength will use isLeapYear
    // month 12 will always have 29 days or 30 days
    // so if we are at 30 of month 12 we should use isLeapYear to check validity
    // and it is more than 30 we should throw immediately
    // but if is less than 30 it is always ok if it is more than 0
    if (month != 12 || day == 30) {
      // month != 12 || (month == 12 && day == 30)
      final ml = monthLength;

      if (day < 1 || day > ml) {
        throw DateException('Jalali day is out of valid range.');
      }
    } else {
      // month == 12 && day != 30
      // from 1 to 29 is valid
      // 30 has been handled
      // more than 30 or less than 1 is invalid
      if (day < 1 || day > 30) {
        throw DateException('Jalali day is out of valid range.');
      }
    }

    // no need for further analysis for MIN, but for MAX being in year 3177:
    if (year == 3177) {
      if (month > 10 || (month == 10 && day > 11)) {
        throw DateException('Jalali date is out of computable range.');
      }
    }
  }

  /// Converts the Julian Day number to a date in the Jalali calendar.
  factory Jalali.fromJulianDayNumber(final int julianDayNumber) {
    if (julianDayNumber < 1925675 || julianDayNumber > 3108616) {
      throw DateException('Julian day number is out of computable range.');
    }

    // Calculate Gregorian year (gy).
    final int gy = Gregorian.fromJulianDayNumber(julianDayNumber).year;
    int jy = gy - 621;
    final r = _JalaliCalculation.calculate(jy);
    final int jdn1f = Gregorian(gy, 3, r.march).julianDayNumber;
    int k = julianDayNumber - jdn1f;
    // Find number of days that passed since 1 Farvardin.
    if (k >= 0) {
      if (k <= 185) {
        // The first 6 months.
        final int jm = 1 + (k ~/ 31);
        final int jd = (k % 31) + 1;

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
    final int jm = 7 + (k ~/ 30);
    final int jd = (k % 30) + 1;

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

  /// Copy this date object with some fields changed
  Jalali copy({int? year, int? month, int? day}) {
    if (year == null && month == null && day == null) {
      return this;
    } else {
      return Jalali(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
      );
    }
  }

  /// Get Jalali date for now
  factory Jalali.now() {
    return Gregorian.now().toJalali();
  }

  /// Converts Jalali date to [DateTime] object
  DateTime toDateTime() {
    return toGregorian().toDateTime();
  }

  /// Converts a Jalali date to Gregorian.
  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(julianDayNumber);
  }

  /// Checks if a year is a leap year or not.
  @override
  bool isLeapYear() {
    return _JalaliCalculation.calculate(year).leap == 0;
  }

  /// Default string representation: `Jalali(YYYY,MM,DD)`.
  /// use formatter for custom formatting.
  @override
  String toString() {
    return 'Jalali($year, $month, $day)';
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

  /// add [days]
  /// this Method is safe
  Jalali operator +(int days) {
    return addDays(days);
  }

  /// subtract [days]
  /// this Method is safe
  Jalali operator -(int days) {
    return addDays(-days);
  }

  /// makes a new date instance and
  /// add [days], [months] and [years] separately
  ///
  /// note: it does not make any conversion, it simply adds to each field value
  /// for subtracting simple add negative value
  ///
  /// UNSAFE
  Jalali add({int years = 0, int months = 0, int days = 0}) {
    if (years == 0 && months == 0 && days == 0) {
      return this;
    } else {
      return Jalali(
        year + years,
        month + months,
        day + days,
      );
    }
  }

  /// makes a new date instance and
  /// add [years] to this date
  Jalali addYears(int years) {
    if (years == 0) {
      return this;
    } else {
      return Jalali(year + years, month, day);
    }
  }

  /// makes a new date instance and
  /// add [months] to this date
  ///
  /// this Method is safe for month and year bounds
  ///
  /// throws DateException on month length or leap crash
  Jalali addMonths(int months) {
    if (months == 0) {
      return this;
    } else {
      // this is fast enough, no need for further optimization
      final int sum = month + months - 1;
      final int mod = sum % 12;
      // can not use "sum ~/ 12" directly
      final int deltaYear = (sum - mod) ~/ 12;

      return Jalali(year + deltaYear, mod + 1, day);
    }
  }

  /// makes a new date instance and
  /// add [days] to this date
  ///
  /// this Method is safe
  Jalali addDays(int days) {
    if (days == 0) {
      return this;
    } else {
      return Jalali.fromJulianDayNumber(julianDayNumber + days);
    }
  }

  /// make a new date instance with changed [year]
  Jalali withYear(int year) {
    if (year == this.year) {
      return this;
    } else {
      return Jalali(year, month, day);
    }
  }

  /// make a new date instance with changed [month]
  Jalali withMonth(int month) {
    if (month == this.month) {
      return this;
    } else {
      return Jalali(year, month, day);
    }
  }

  /// make a new date instance with changed [day]
  Jalali withDay(int day) {
    if (day == this.day) {
      return this;
    } else {
      return Jalali(year, month, day);
    }
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

  /// hashCode operator
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

  _JalaliCalculation({
    required this.leap,
    required this.gy,
    required this.march,
  });

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
      3178,
    ];

    final int bl = breaks.length;
    final int gy = jy + 621;
    int leapJ = -14;
    int jp = breaks[0];
    int jump = 0;

    // should not happen
    if (jy < -61 || jy >= 3178) {
      throw StateError('should not happen');
    }

    // Find the limiting years for the Jalali year jy.
    for (int i = 1; i < bl; i += 1) {
      final int jm = breaks[i];
      jump = jm - jp;
      if (jy < jm) {
        break;
      }
      leapJ = leapJ + (jump ~/ 33) * 8 + (((jump % 33)) ~/ 4);
      jp = jm;
    }
    int n = jy - jp;

    // Find the number of leap years from AD 621 to the beginning
    // of the current Jalali year in the Persian calendar.
    leapJ = leapJ + ((n) ~/ 33) * 8 + (((n % 33) + 3) ~/ 4);
    if ((jump % 33) == 4 && jump - n == 4) {
      leapJ += 1;
    }

    // And the same in the Gregorian calendar (until the year gy).
    final int leapG = ((gy) ~/ 4) - (((((gy) ~/ 100) + 1) * 3) ~/ 4) - 150;

    // Determine the Gregorian date of Farvardin the 1st.
    final int march = 20 + leapJ - leapG;

    // Find how many years have passed since the last leap year.
    if (jump - n < 6) {
      n = n - jump + ((jump + 4) ~/ 33) * 33;
    }
    int leap = ((((n + 1) % 33) - 1) % 4);
    if (leap == -1) {
      leap = 4;
    }

    return _JalaliCalculation(leap: leap, gy: gy, march: march);
  }
}
