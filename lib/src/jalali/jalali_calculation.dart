part of 'jalali_date.dart';

/// Internal used for Jalali calculation
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
