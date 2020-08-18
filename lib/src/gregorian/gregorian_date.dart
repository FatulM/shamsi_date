// Copyright 2018 - 2020, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library gregorian_date;

import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_formatter.dart';
import '../jalali/jalali_date.dart';

/// Gregorian date class
class Gregorian implements Date, Comparable<Gregorian> {
  /// Gregorian month lengths
  ///
  /// For month 2 (index 1) should check leap year
  static const List<int> _MONTH_LENGTHS = <int>[
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
    31
  ];

  /// Minimum computable Gregorian date
  ///
  /// equivalent to Gregorian(560,3,20) and Jalali(-61,1,1)
  /// and julian day number of 1925675
  // ignore: non_constant_identifier_names
  static final Gregorian MIN = Gregorian(560, 3, 20);

  /// Maximum computable Gregorian date
  ///
  /// equivalent to Gregorian(3798,12,31) and Jalali(3177,10,11)
  /// and julian day number of 3108616
  // ignore: non_constant_identifier_names
  static final Gregorian MAX = Gregorian(3798, 12, 31);

  /// Gregorian year (years BC numbered 0, -1, -2, ...)
  ///
  /// non-null
  @override
  final int year;

  /// Gregorian month (1 to 12)
  ///
  /// non-null
  @override
  final int month;

  /// Gregorian day of the month (1 to 28/29/30/31)
  ///
  /// non-null
  @override
  final int day;

  /// Calculates the Julian Day number from Gregorian or Julian
  /// calendar dates. This integer number corresponds to the noon of
  /// the date (i.e. 12 hours of Universal Time).
  ///
  /// The procedure was tested to be good since 1 March, -100100 (of both
  /// calendars) up to a few million years into the future.
  ///
  /// non-null
  @override
  int get julianDayNumber {
    int d = (((year + ((month - 8) ~/ 6) + 100100) * 1461) ~/ 4) +
        ((153 * ((month + 9) % 12) + 2) ~/ 5) +
        day -
        34840408;
    d = d - ((((year + 100100 + ((month - 8) ~/ 6)) ~/ 100) * 3) ~/ 4) + 752;

    return d;
  }

  /// Week day number
  /// [monday] = 1
  /// [sunday] = 7
  ///
  /// non-null
  @override
  int get weekDay {
    return julianDayNumber % 7 + 1;
  }

  /// Computes number of days in a given month in a Gregorian year.
  ///
  /// non-null
  @override
  int get monthLength {
    if (month == 2) {
      return isLeapYear() ? 29 : 28;
    } else {
      return _MONTH_LENGTHS[month - 1];
    }
  }

  /// Formatter for this date object
  ///
  /// non-null
  @override
  GregorianFormatter get formatter {
    return GregorianFormatter(this);
  }

  /// Create a Gregorian date by using year, month and day
  /// year and month default to 1
  /// [year], [month] and [day] can not be null
  ///
  /// throws on null arguments
  ///
  /// non-null
  Gregorian(int year, [int month = 1, int day = 1])
      : year = year,
        month = month,
        day = day {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    // should be between: Gregorian(560,3,20) and Gregorian(3798,12,31)
    if (year < 560 || year > 3798) {
      throw DateException('Gregorian date is out of computable range.');
    }

    if (month < 1 || month > 12) {
      throw DateException('Gregorian month is out of valid range.');
    }

    // todo very bad !!!!
    final ml = monthLength;

    if (day < 1 || day > ml) {
      throw DateException('Gregorian day is out of valid range.');
    }

    // no need for further analysis for MAX, but for MIN being in year 560:
    if (year == 560) {
      if (month < 3 || (month == 3 && day < 20)) {
        throw DateException('Gregorian date is out of computable range.');
      }
    }
  }

  /// Calculates Gregorian and Julian calendar dates from the Julian Day number
  /// [julianDayNumber] for the period since jdn=-34839655 (i.e. the year -100100 of both
  /// calendars) to some millions years ahead of the present.
  ///
  /// throws on null argument
  ///
  /// non-null
  factory Gregorian.fromJulianDayNumber(int julianDayNumber) {
    ArgumentError.checkNotNull(julianDayNumber, 'julianDayNumber');

    if (julianDayNumber < 1925675 || julianDayNumber > 3108616) {
      throw DateException('Julian day number is out of computable range.');
    }

    int j, i, gd, gm, gy;

    j = 4 * julianDayNumber + 139361631;
    j = j +
        ((((4 * julianDayNumber + 183187720) ~/ 146097) * 3) ~/ 4) * 4 -
        3908;
    i = (((j % 1461)) ~/ 4) * 5 + 308;
    gd = (((i % 153)) ~/ 5) + 1;
    gm = (((i) ~/ 153) % 12) + 1;
    gy = ((j) ~/ 1461) - 100100 + ((8 - gm) ~/ 6);

    return Gregorian(gy, gm, gd);
  }

  /// Create a Gregorian date by using [DateTime] object
  ///
  /// throws on null argument
  ///
  /// non-null
  factory Gregorian.fromDateTime(DateTime dateTime) {
    ArgumentError.checkNotNull(dateTime, 'dateTime');

    return Gregorian(dateTime.year, dateTime.month, dateTime.day);
  }

  /// Create a Gregorian date from Jalali date
  ///
  /// throws on null argument
  ///
  /// non-null
  factory Gregorian.fromJalali(Jalali date) {
    ArgumentError.checkNotNull(date, 'date');

    return Gregorian.fromJulianDayNumber(date.julianDayNumber);
  }

  /// Get Gregorian date for now
  ///
  /// non-null
  factory Gregorian.now() {
    return Gregorian.fromDateTime(DateTime.now());
  }

  /// Copy this date object with some fields changed
  ///
  /// non-null
  Gregorian copy({int year, int month, int day}) {
    if (year == null && month == null && day == null) {
      return this;
    } else {
      return Gregorian(year ?? this.year, month ?? this.month, day ?? this.day);
    }
  }

  /// Converts Gregorian date to [DateTime] object
  ///
  /// non-null
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  /// Converts a Gregorian date to Jalali.
  ///
  /// non-null
  Jalali toJalali() {
    return Jalali.fromJulianDayNumber(julianDayNumber);
  }

  /// Checks if a year is a leap year or not.
  ///
  /// non-null
  @override
  bool isLeapYear() {
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

  /// Default string representation: `Gregorian(YYYY,MM,DD)`.
  /// use formatter for custom formatting.
  ///
  /// non-null
  @override
  String toString() {
    return 'Gregorian($year,$month,$day)';
  }

  /// Compare dates
  ///
  /// throws on null argument
  ///
  /// non-null
  @override
  int compareTo(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

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
  ///
  /// throws on null argument
  ///
  /// non-null
  bool operator >(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) > 0;
  }

  /// bigger than or equal operator
  ///
  /// throws on null argument
  ///
  /// non-null
  bool operator >=(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) >= 0;
  }

  /// less than operator
  ///
  /// throws on null argument
  ///
  /// non-null
  bool operator <(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) < 0;
  }

  /// less than or equal operator
  ///
  /// throws on null argument
  ///
  /// non-null
  bool operator <=(Gregorian other) {
    ArgumentError.checkNotNull(other, 'other');

    return compareTo(other) <= 0;
  }

  /// add [days]
  /// this Method is safe
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian operator +(int days) {
    ArgumentError.checkNotNull(days, 'days');

    return addDays(days);
  }

  /// subtract [days]
  /// this Method is safe
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian operator -(int days) {
    ArgumentError.checkNotNull(days, 'days');

    return addDays(-days);
  }

  /// add [days], [months] and [years] separately
  /// note: it does not make any conversion, it simply adds to each field value
  /// for subtracting simple add negative value
  ///
  /// UNSAFE
  ///
  /// throws on null arguments
  ///
  /// non-null
  Gregorian add({int years = 0, int months = 0, int days = 0}) {
    ArgumentError.checkNotNull(years, 'years');
    ArgumentError.checkNotNull(months, 'months');
    ArgumentError.checkNotNull(days, 'days');

    if (years == 0 && months == 0 && days == 0) {
      return this;
    } else {
      return Gregorian(year + years, month + months, day + days);
    }
  }

  /// add [years] to this date
  ///
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian addYears(int years) {
    ArgumentError.checkNotNull(years, 'years');

    if (years == 0) {
      return this;
    } else {
      return Gregorian(year + years, month, day);
    }
  }

  /// add [months] to this date
  /// this Method is safe
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian addMonths(int months) {
    ArgumentError.checkNotNull(months, 'months');

    if (months == 0) {
      return this;
    } else {
      // this is fast enough, no need for further optimization
      final int sum = month + months - 1;
      final int mod = sum % 12;
      // can not use "sum ~/ 12" directly
      final int deltaYear = (sum - mod) ~/ 12;

      // todo what to do on leap crash ?
      return Gregorian(year + deltaYear, mod + 1, day);
    }
  }

  /// add [days] to this date
  /// this Method is safe
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian addDays(int days) {
    ArgumentError.checkNotNull(days, 'days');

    if (days == 0) {
      return this;
    } else {
      // todo can be simplified ?
      return Gregorian.fromJulianDayNumber(julianDayNumber + days);
    }
  }

  /// changes [year]
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian withYear(int year) {
    ArgumentError.checkNotNull(year, "year");

    if (year == this.year) {
      return this;
    } else {
      return Gregorian(year, month, day);
    }
  }

  /// changes [month]
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian withMonth(int month) {
    ArgumentError.checkNotNull(month, "month");

    if (month == this.month) {
      return this;
    } else {
      return Gregorian(year, month, day);
    }
  }

  /// changes [day]
  ///
  /// throws on null argument
  ///
  /// non-null
  Gregorian withDay(int day) {
    ArgumentError.checkNotNull(day, "day");

    if (day == this.day) {
      return this;
    } else {
      return Gregorian(year, month, day);
    }
  }

  /// equals operator
  ///
  /// non-null
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Gregorian &&
            runtimeType == other.runtimeType &&
            year == other.year &&
            month == other.month &&
            day == other.day;
  }

  /// hashcode operator
  ///
  /// non-null
  @override
  int get hashCode {
    return year.hashCode ^ month.hashCode ^ day.hashCode;
  }
}
