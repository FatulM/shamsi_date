// Copyright 2018 - 2024, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of 'gregorian_date.dart';

/// Internal class for algorithms
class _Algo {
  /// no instances
  const _Algo._();

  /// Gregorian month lengths
  ///
  /// For month 2 (index 1) should check leap year
  static const List<int> _monthLengths = <int>[
    31,
    0, // should check leap year
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];

  /// Checks if a year is a leap year or not.
  static bool isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        return year % 400 == 0;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  /// Computes number of days in a given month in a Gregorian year.
  static int getMonthLength(int year, int month) {
    if (month == 2) {
      return isLeapYear(year) ? 29 : 28;
    } else {
      return _monthLengths[month - 1];
    }
  }

  /// create from julian day number
  ///
  /// Calculates Gregorian and Julian calendar dates from the Julian Day number
  /// [julianDayNumber] for the period since jdn=-34839655
  /// (i.e. the year -100100 of both calendars)
  /// to some millions years ahead of the present.
  static Gregorian createFromJulianDayNumber(
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

    final int j = 4 * julianDayNumber +
        139361631 +
        ((((4 * julianDayNumber + 183187720) ~/ 146097) * 3) ~/ 4) * 4 -
        3908;
    final int i = (((j % 1461)) ~/ 4) * 5 + 308;
    final int gd = (((i % 153)) ~/ 5) + 1;
    final int gm = (((i) ~/ 153) % 12) + 1;
    final int gy = ((j) ~/ 1461) - 100100 + ((8 - gm) ~/ 6);

    return Gregorian._raw(
      julianDayNumber,
      gy,
      gm,
      gd,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// create from year, month and day
  ///
  /// Calculates the Julian Day number from Gregorian or Julian
  /// calendar dates. This integer number corresponds to the noon of
  /// the date (i.e. 12 hours of Universal Time).
  ///
  /// The procedure was tested to be good since 1 March, -100100 (of both
  /// calendars) up to a few million years into the future.
  static Gregorian createFromYearMonthDay(
    int year,
    int month,
    int day,
    int hour,
    int minute,
    int second,
    int millisecond,
  ) {
    if (year < 560 || year > 3798) {
      throw DateException('Gregorian date is out of computable range.');
    }

    if (month < 1 || month > 12) {
      throw DateException('Gregorian month is out of valid range.');
    }

    // monthLength is very cheap
    // isLeapYear is also very cheap
    final ml = getMonthLength(year, month);

    if (day < 1 || day > ml) {
      throw DateException('Gregorian day is out of valid range.');
    }

    // no need for further analysis for MAX, but for MIN being in year 560:
    if (year == 560) {
      if (month < 3 || (month == 3 && day < 20)) {
        throw DateException('Gregorian date is out of computable range.');
      }
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

    final julianDayNumber =
        (((year + ((month - 8) ~/ 6) + 100100) * 1461) ~/ 4) +
            ((153 * ((month + 9) % 12) + 2) ~/ 5) +
            day -
            34840408 -
            ((((year + 100100 + ((month - 8) ~/ 6)) ~/ 100) * 3) ~/ 4) +
            752;

    return Gregorian._raw(
      julianDayNumber,
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }
}
