// Copyright 2018 - 2019, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library gregorian_date;

import 'package:shamsi_date/src/date.dart';
import 'package:shamsi_date/src/gregorian/gregorian_formatter.dart';
import 'package:shamsi_date/src/jalali/jalali_date.dart';

/// Gregorian date class
class Gregorian implements Date, Comparable<Gregorian> {
  /// Gregorian year (years BC numbered 0, -1, -2, ...)
  @override
  final int year;

  /// Gregorian month (1 to 12)
  @override
  final int month;

  /// Gregorian day of the month (1 to 28/29/30/31)
  @override
  final int day;

  /// Calculates the Julian Day number from Gregorian or Julian
  /// calendar dates. This integer number corresponds to the noon of
  /// the date (i.e. 12 hours of Universal Time).
  ///
  /// The procedure was tested to be good since 1 March, -100100 (of both
  /// calendars) up to a few million years into the future.
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
  @override
  int get weekDay => julianDayNumber % 7 + 1;

  /// Computes number of days in a given month in a Gregorian year.
  @override
  int get monthLength {
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
      case 2:
        return isLeapYear() ? 29 : 28;
      default:
        throw 'month not valid';
    }
  }

  /// Formatter for this date object
  @override
  GregorianFormatter get formatter => GregorianFormatter(this);

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
        ((((4 * julianDayNumber + 183187720) ~/ 146097) * 3) ~/ 4) * 4 -
        3908;
    i = (((j % 1461)) ~/ 4) * 5 + 308;
    gd = (((i % 153)) ~/ 5) + 1;
    gm = (((i) ~/ 153) % 12) + 1;
    gy = ((j) ~/ 1461) - 100100 + ((8 - gm) ~/ 6);

    return Gregorian(gy, gm, gd);
  }

  /// Create a Gregorian date by using [DateTime] object
  Gregorian.fromDateTime(DateTime dateTime)
      : this(dateTime.year, dateTime.month, dateTime.day);

  /// Create a Gregorian date from Jalali date
  factory Gregorian.fromJalali(Jalali date) {
    return Gregorian.fromJulianDayNumber(date.julianDayNumber);
  }

  /// Get Gregorian date for now
  factory Gregorian.now() {
    return Gregorian.fromDateTime(DateTime.now());
  }

  /// Copy this date object with some fields changed
  Gregorian copy({int year, int month, int day}) {
    if (year == null && month == null && day == null) {
      return this;
    } else {
      return Gregorian(year ?? this.year, month ?? this.month, day ?? this.day);
    }
  }

  /// Converts Gregorian date to [DateTime] object
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  /// Converts a Gregorian date to Jalali.
  Jalali toJalali() {
    return Jalali.fromJulianDayNumber(julianDayNumber);
  }

  /// Checks if a year is a leap year or not.
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

  /// Checks whether a Gregorian date is valid or not.
  @override
  bool isValid() {
    return year >= -100100 &&
        year <= 10000000 &&
        month >= 1 &&
        month <= 12 &&
        day >= 1 &&
        day <= monthLength;
  }

  /// Default string representation: `YYYY/MM/DD`
  @override
  String toString() {
    return '$year/$month/$day';
  }

  /// Compare dates
  @override
  int compareTo(Gregorian other) {
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
  bool operator >(Gregorian other) {
    return compareTo(other) > 0;
  }

  /// bigger than or equal operator
  bool operator >=(Gregorian other) {
    return compareTo(other) >= 0;
  }

  /// less than operator
  bool operator <(Gregorian other) {
    return compareTo(other) < 0;
  }

  /// less than or equal operator
  bool operator <=(Gregorian other) {
    return compareTo(other) <= 0;
  }

  /// add [days]
  Gregorian operator +(int days) {
    if (days == 0) {
      return this;
    } else {
      return Gregorian.fromJulianDayNumber(julianDayNumber + days);
    }
  }

  /// subtract [days]
  Gregorian operator -(int days) {
    if (days == 0) {
      return this;
    } else {
      return Gregorian.fromJulianDayNumber(julianDayNumber - days);
    }
  }

  /// add [days], [months] and [years] separately
  /// note: it does not make any conversion, it simply adds to each field value
  /// for subtracting simple add negative value
  Gregorian add({int years = 0, int months = 0, int days = 0}) {
    if (years == 0 && months == 0 && days == 0) {
      return this;
    } else {
      return Gregorian(year + years, month + months, day + days);
    }
  }

  /// equals operator
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
  @override
  int get hashCode {
    return year.hashCode ^ month.hashCode ^ day.hashCode;
  }
}
