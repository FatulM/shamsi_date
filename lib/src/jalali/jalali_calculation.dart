// Copyright 2018 - 2024, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of 'jalali_date.dart';

/// Internal class for algorithms
class _Algo {
  /// No instances
  const _Algo._();

  /// This determines if the Jalali (Persian) year is
  /// leap (366-day long) or is the common year (365 days), and
  /// finds the day in March (Gregorian calendar) of the first
  /// day of the Jalali year (jy).
  ///
  /// [1. see here](http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm)
  ///
  /// [2. see here](http://www.fourmilab.ch/documents/calendar/)
  static _JalaliCalculation calculate(int jy) {
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

  /// create from julian day number
  static Jalali createFromJulianDayNumber(
    int julianDayNumber,
    int hour,
    int minute,
    int second,
    int millisecond,
  ) {
    if (julianDayNumber < 1925675 || julianDayNumber > 3108616) {
      throw DateException('Julian day number is out of computable range.');
    }

    if (hour < 0 || hour > 23) {
      throw DateException('Hour is out of bounds. [0..23]');
    }
    if (minute < 0 || minute > 59) {
      throw DateException('Minute is out of bounds. [0..59]');
    }
    if (second < 0 || second > 59) {
      throw DateException('Second is out of bounds. [0..59]');
    }
    if (millisecond < 0 || millisecond > 999) {
      throw DateException('Millisecond is out of bounds. [0..999]');
    }

    // Calculate Gregorian year (gy).
    final int gy = Gregorian.fromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    ).year;
    int jy = gy - 621;
    final r = calculate(jy);
    bool isLeap = r.leap == 0;
    final int jdn1f = Gregorian(
      gy,
      3,
      r.march,
      hour,
      minute,
      second,
      millisecond,
    ).julianDayNumber;
    int k = julianDayNumber - jdn1f;
    // Find number of days that passed since 1 Farvardin.
    if (k >= 0) {
      if (k <= 185) {
        // The first 6 months.
        final int jm = 1 + (k ~/ 31);
        final int jd = (k % 31) + 1;

        return Jalali._raw(
          julianDayNumber,
          jy,
          jm,
          jd,
          hour,
          minute,
          second,
          millisecond,
          isLeap,
        );
      } else {
        // The remaining months.
        k -= 186;
      }
    } else {
      // Previous Jalali year.
      jy -= 1;
      k += 179;
      if (r.leap == 1) k += 1;

      // since we changed jalali year to previous
      // we calculated r for next year
      isLeap = r.leap == 1;
    }
    final int jm = 7 + (k ~/ 30);
    final int jd = (k % 30) + 1;

    return Jalali._raw(
      julianDayNumber,
      jy,
      jm,
      jd,
      hour,
      minute,
      second,
      millisecond,
      isLeap,
    );
  }

  /// create from year, month and day
  static Jalali createFromYearMonthDay(
    int year,
    int month,
    int day,
    int hour,
    int minute,
    int second,
    int millisecond,
  ) {
    // should be between: Jalali(-61, 1, 1) and Jalali(3177, 10, 11)
    if (year < -61 || year > 3177) {
      throw DateException('Jalali date is out of computable range.');
    }

    // check month
    if (month < 1 || month > 12) {
      throw DateException('Jalali month is out of valid range.');
    }

    // check lower bound of day
    if (day < 1) {
      throw DateException('Jalali day is out of valid range.');
    }

    // no need for further analysis for MIN, but for MAX being in year 3177:
    if (year == 3177) {
      if (month > 10 || (month == 10 && day > 11)) {
        throw DateException('Jalali date is out of computable range.');
      }
    }

    // first part of julian day number calculation
    final r = calculate(year);
    final isLeap = r.leap == 0;

    // calculate month length
    final int ml = month == 12 ? (isLeap ? 30 : 29) : (month > 6 ? 30 : 31);

    // check upper bound of day
    if (day > ml) {
      throw DateException('Jalali day is out of valid range.');
    }

    if (hour < 0 || hour > 23) {
      throw DateException('Hour is out of bounds. [0..23]');
    }
    if (minute < 0 || minute > 59) {
      throw DateException('Minute is out of bounds. [0..59]');
    }
    if (second < 0 || second > 59) {
      throw DateException('Second is out of bounds. [0..59]');
    }
    if (millisecond < 0 || millisecond > 999) {
      throw DateException('Millisecond is out of bounds. [0..999]');
    }

    // second part of julian day number calculation
    final julianDayNumber = Gregorian(
          r.gy,
          3,
          r.march,
          hour,
          minute,
          second,
          millisecond,
        ).julianDayNumber +
        (month - 1) * 31 -
        (month ~/ 7) * (month - 7) +
        day -
        1;

    return Jalali._raw(
      julianDayNumber,
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      isLeap,
    );
  }
}

/// Internal used for Jalali calculation
class _JalaliCalculation {
  /// Number of years since the last leap year
  /// (0 (inclusive) to 4 (exclusive))
  final int leap;

  /// Gregorian year of the beginning of Jalali year
  final int gy;

  /// The March day of Farvardin the 1st (1st day of jy)
  final int march;

  const _JalaliCalculation({
    required this.leap,
    required this.gy,
    required this.march,
  });
}
