library shamsi_date;

import 'package:meta/meta.dart';

@immutable
class Jalali {
  final int year;
  final int month;
  final int day;

  /*
    Converts a date of the Jalali calendar to the Julian Day number.
    @param jy Jalali year (1 to 3100)
    @param jm Jalali month (1 to 12)
    @param jd Jalali day (1 to 29/31)
    @return Julian Day number
  */
  int get julianDayNumber {
    final r = _JalaliCalculation.calculate(year);

    return Gregorian(year: r.gy, month: 3, day: r.march).julianDayNumber +
        (month - 1) * 31 -
        _div(month, 7) * (month - 7) +
        day -
        1;
  }

  Jalali({this.year, this.month, this.day});

  /*
    Converts the Julian Day number to a date in the Jalali calendar.
    @param jdn Julian Day number
    @return
      jy: Jalali year (1 to 3100)
      jm: Jalali month (1 to 12)
      jd: Jalali day (1 to 29/31)
  */
  static Jalali fromJulianDayNumber(julianDayNumber) {
    // Calculate Gregorian year (gy).
    int gy = Gregorian.fromJulianDayNumber(julianDayNumber).year;
    int jy = gy - 621;
    final r = _JalaliCalculation.calculate(jy);
    int jdn1f = Gregorian(year: gy, month: 3, day: r.march).julianDayNumber;
    int jd, jm, k;

    // Find number of days that passed since 1 Farvardin.
    k = julianDayNumber - jdn1f;
    if (k >= 0) {
      if (k <= 185) {
        // The first 6 months.
        jm = 1 + _div(k, 31);
        jd = _mod(k, 31) + 1;

        return Jalali(year: jy, month: jm, day: jd);
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

    return Jalali(year: jy, month: jm, day: jd);
  }

  /*
    Converts a Jalali date to Gregorian.
  */
  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(julianDayNumber);
  }

  /*
    Checks whether a Jalali date is valid or not.
  */
  bool isValid() {
    return year >= -61 &&
        year <= 3177 &&
        month >= 1 &&
        month <= 12 &&
        day >= 1 &&
        day <= monthLength(year: year, month: month);
  }

  /*
    Is this a leap year or not?
  */
  static bool isLeapYear(int year) {
    return _JalaliCalculation.calculate(year).leap == 0;
  }

  /*
    Number of days in a given month in a Jalali year.
  */
  static int monthLength({int year, int month}) {
    if (month <= 6) return 31;
    if (month <= 11) return 30;
    if (isLeapYear(year)) return 30;
    return 29;
  }

  @override
  String toString() {
    return '$year/$month/$day';
  }
}

@immutable
class Gregorian {
  final int year;
  final int month;
  final int day;

  /*
    Calculates the Julian Day number from Gregorian or Julian
    calendar dates. This integer number corresponds to the noon of
    the date (i.e. 12 hours of Universal Time).
    The procedure was tested to be good since 1 March, -100100 (of both
    calendars) up to a few million years into the future.
    @param gy Calendar year (years BC numbered 0, -1, -2, ...)
    @param gm Calendar month (1 to 12)
    @param gd Calendar day of the month (1 to 28/29/30/31)
    @return Julian Day number
  */
  int get julianDayNumber {
    int d = _div((year + _div(month - 8, 6) + 100100) * 1461, 4) +
        _div(153 * _mod(month + 9, 12) + 2, 5) +
        day -
        34840408;
    d = d - _div(_div(year + 100100 + _div(month - 8, 6), 100) * 3, 4) + 752;

    return d;
  }

  Gregorian({this.year, this.month, this.day});

  /*
    Calculates Gregorian and Julian calendar dates from the Julian Day number
    (jdn) for the period since jdn=-34839655 (i.e. the year -100100 of both
    calendars) to some millions years ahead of the present.
    @param jdn Julian Day number
    @return
      gy: Calendar year (years BC numbered 0, -1, -2, ...)
      gm: Calendar month (1 to 12)
      gd: Calendar day of the month M (1 to 28/29/30/31)
  */
  static Gregorian fromJulianDayNumber(int julianDayNumber) {
    int j, i, gd, gm, gy;

    j = 4 * julianDayNumber + 139361631;
    j = j +
        _div(_div(4 * julianDayNumber + 183187720, 146097) * 3, 4) * 4 -
        3908;
    i = _div(_mod(j, 1461), 4) * 5 + 308;
    gd = _div(_mod(i, 153), 5) + 1;
    gm = _mod(_div(i, 153), 12) + 1;
    gy = _div(j, 1461) - 100100 + _div(8 - gm, 6);

    return Gregorian(year: gy, month: gm, day: gd);
  }

  /*
    Converts a Gregorian date to Jalali.
  */
  Jalali toJalali() {
    return Jalali.fromJulianDayNumber(julianDayNumber);
  }

  @override
  String toString() {
    return '$year/$month/$day';
  }
}

@immutable
class _JalaliCalculation {
  final int leap;
  final int gy;
  final int march;

  _JalaliCalculation({this.leap, this.gy, this.march});

  /*
    This determines if the Jalali (Persian) year is
    leap (366-day long) or is the common year (365 days), and
    finds the day in March (Gregorian calendar) of the first
    day of the Jalali year (jy).
    @param jy Jalali calendar year (-61 to 3177)
    @return
      leap: number of years since the last leap year (0 to 4)
      gy: Gregorian year of the beginning of Jalali year
      march: the March day of Farvardin the 1st (1st day of jy)
    @see: http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm
    @see: http://www.fourmilab.ch/documents/calendar/
  */
  static _JalaliCalculation calculate(int jy) {
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

/*
  Utility helper functions.
*/

int _div(int a, int b) {
  return a ~/ b;
}

int _mod(int a, int b) {
  return a % b;
}
