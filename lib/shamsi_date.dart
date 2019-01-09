library shamsi_date;

/// Jalali (Shamsi or Persian) Date class
class Jalali {
  /// Jalali year (1 to 3100)
  final int year;

  /// Jalali month (1 to 12)
  final int month;

  /// Jalali day (1 to 29/31)
  final int day;

  /// Converts a date of the Jalali calendar to the Julian Day number.
  int get julianDayNumber {
    final r = _JalaliCalculation.calculate(year);

    return Gregorian(r.gy, 3, r.march).julianDayNumber +
        (month - 1) * 31 -
        _div(month, 7) * (month - 7) +
        day -
        1;
  }

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
        jm = 1 + _div(k, 31);
        jd = _mod(k, 31) + 1;

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
    jm = 7 + _div(k, 30);
    jd = _mod(k, 30) + 1;

    return Jalali(jy, jm, jd);
  }

  /// Create a Jalali date by using [DateTime] object
  factory Jalali.fromDateTime(DateTime dateTime) {
    return Gregorian.fromDateTime(dateTime).toJalali();
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
}

/// Gregorian date class
class Gregorian {
  /// Gregorian year (years BC numbered 0, -1, -2, ...)
  final int year;

  /// Gregorian month (1 to 12)
  final int month;

  /// Gregorian day of the month (1 to 28/29/30/31)
  final int day;

  /// Calculates the Julian Day number from Gregorian or Julian
  /// calendar dates. This integer number corresponds to the noon of
  /// the date (i.e. 12 hours of Universal Time).
  ///
  /// The procedure was tested to be good since 1 March, -100100 (of both
  /// calendars) up to a few million years into the future.
  int get julianDayNumber {
    int d = _div((year + _div(month - 8, 6) + 100100) * 1461, 4) +
        _div(153 * _mod(month + 9, 12) + 2, 5) +
        day -
        34840408;
    d = d - _div(_div(year + 100100 + _div(month - 8, 6), 100) * 3, 4) + 752;

    return d;
  }

  /// Create a Gregorian date by using year, month and day
  /// year and month default to 1
  Gregorian(this.year, [this.month = 1, this.day = 1]);

  /// Calculates Gregorian and Julian calendar dates from the Julian Day number
  /// [julianDayNumber] for the period since jdn=-34839655 (i.e. the year -100100 of both
  /// calendars) to some millions years ahead of the present.
  factory Gregorian.fromJulianDayNumber(int julianDayNumber) {
    int j, i, gd, gm, gy;

    j = 4 * julianDayNumber + 139361631;
    j = j +
        _div(_div(4 * julianDayNumber + 183187720, 146097) * 3, 4) * 4 -
        3908;
    i = _div(_mod(j, 1461), 4) * 5 + 308;
    gd = _div(_mod(i, 153), 5) + 1;
    gm = _mod(_div(i, 153), 12) + 1;
    gy = _div(j, 1461) - 100100 + _div(8 - gm, 6);

    return Gregorian(gy, gm, gd);
  }

  /// Create a Gregorian date by using [DateTime] object
  Gregorian.fromDateTime(DateTime dateTime)
      : this(dateTime.year, dateTime.month, dateTime.day);

  /// Get Gregorian date for now
  factory Gregorian.now() {
    return Gregorian.fromDateTime(DateTime.now());
  }

  /// Converts Gregorian date to [DateTime] object
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  /// Converts a Gregorian date to Jalali.
  Jalali toJalali() {
    return Jalali.fromJulianDayNumber(julianDayNumber);
  }

  /// Default string representation: `YYYY/MM/DD`
  @override
  String toString() {
    return '$year/$month/$day';
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
    final breaks = [
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

    if (jy < jp || jy >= breaks[bl - 1]) throw 'Invalid Jalali year $jy';

    // Find the limiting years for the Jalali year jy.
    for (i = 1; i < bl; i += 1) {
      jm = breaks[i];
      jump = jm - jp;
      if (jy < jm) break;
      leapJ = leapJ + _div(jump, 33) * 8 + _div(_mod(jump, 33), 4);
      jp = jm;
    }
    n = jy - jp;

    // Find the number of leap years from AD 621 to the beginning
    // of the current Jalali year in the Persian calendar.
    leapJ = leapJ + _div(n, 33) * 8 + _div(_mod(n, 33) + 3, 4);
    if (_mod(jump, 33) == 4 && jump - n == 4) leapJ += 1;

    // And the same in the Gregorian calendar (until the year gy).
    leapG = _div(gy, 4) - _div((_div(gy, 100) + 1) * 3, 4) - 150;

    // Determine the Gregorian date of Farvardin the 1st.
    march = 20 + leapJ - leapG;

    // Find how many years have passed since the last leap year.
    if (jump - n < 6) n = n - jump + _div(jump + 4, 33) * 33;
    leap = _mod(_mod(n + 1, 33) - 1, 4);
    if (leap == -1) {
      leap = 4;
    }

    return _JalaliCalculation(leap: leap, gy: gy, march: march);
  }
}

/// Utility helper int div function.
int _div(int a, int b) {
  return a ~/ b;
}

/// Utility helper int mod function.
int _mod(int a, int b) {
  return a % b;
}
