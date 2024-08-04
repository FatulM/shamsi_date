// Copyright 2018 - 2024, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_formatter.dart';
import '../jalali/jalali_date.dart';

part 'gregorian_calculation.dart';

/// Gregorian (Miladi or Milaadi) date class
///
/// Date objects are required to be immutable
///
/// Dates should be uniquely specified by year, month and day
/// Or by using julian day number
///
/// Date objects are valid dates once constructed,
/// It should throw exception when there is a validity or calculation problem
///
/// For example constructing date with day being out of month length
/// or date being out of computable region throws DateException
class Gregorian extends Date {
  /// Minimum computable Gregorian date
  ///
  /// equivalent to Gregorian(560,3,20) and Jalali(-61,1,1)
  /// and julian day number of 1925675
  static const Gregorian min = Gregorian._raw(1925675, 560, 3, 20, 0, 0, 0, 0);

  /// Maximum computable Gregorian date
  ///
  /// equivalent to Gregorian(3798,12,31) and Jalali(3177,10,11)
  /// and julian day number of 3108616
  static const Gregorian max =
      Gregorian._raw(3108616, 3798, 12, 31, 23, 59, 59, 999);

  /// Internal constructor without any checks whatsoever
  const Gregorian._raw(
    this.julianDayNumber,
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
  );

  /// Julian Day Number
  @override
  final int julianDayNumber;

  /// Gregorian year (years BC numbered 0, -1, -2, ...)
  @override
  final int year;

  /// Gregorian month (1 to 12)
  @override
  final int month;

  /// Gregorian day of the month (1 to 28/29/30/31)
  @override
  final int day;

  @override
  final int hour;

  @override
  final int minute;

  @override
  final int second;

  @override
  final int millisecond;

  /// Week day number
  /// [monday] = 1
  /// [sunday] = 7
  @override
  int get weekDay {
    return julianDayNumber % 7 + 1;
  }

  /// Computes number of days in a given month in a Gregorian year.
  @override
  int get monthLength {
    return _Algo.getMonthLength(year, month);
  }

  /// Formatter for this date object
  @override
  GregorianFormatter get formatter {
    return GregorianFormatter(this);
  }

  /// Create a Gregorian date by using [year], [month] and [day]
  ///
  /// year and month default to 1
  factory Gregorian(
    final int year, [
    final int month = 1,
    final int day = 1,
    final int hour = 0,
    final int minute = 0,
    final int second = 0,
    final int millisecond = 0,
  ]) {
    return _Algo.createFromYearMonthDay(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// Calculates Gregorian and Julian calendar dates from the Julian Day number
  /// [julianDayNumber] for the period since jdn=-34839655
  /// (i.e. the year -100100 of both calendars)
  /// to some millions years ahead of the present.
  factory Gregorian.fromJulianDayNumber(
    final int julianDayNumber, [
    final int hour = 0,
    final int minute = 0,
    final int second = 0,
    final int millisecond = 0,
  ]) {
    return _Algo.createFromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// Create a Gregorian date by using [DateTime] object
  factory Gregorian.fromDateTime(DateTime dateTime) {
    return Gregorian(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond,
    );
  }

  /// Create a Gregorian date from Jalali date
  factory Gregorian.fromJalali(Jalali date) {
    return Gregorian.fromJulianDayNumber(
      date.julianDayNumber,
      date.hour,
      date.minute,
      date.second,
      date.millisecond,
    );
  }

  /// Create a Gregorian date from milliseconds since epoch
  ///
  /// If [isUtc] is false then the date is in the local time zone
  factory Gregorian.fromMillisecondsSinceEpoch(
    int milliseconds, {
    bool isUtc = false,
  }) {
    return Gregorian.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(
        milliseconds,
        isUtc: isUtc,
      ),
    );
  }

  /// Get Gregorian date for now
  factory Gregorian.now() {
    return Gregorian.fromDateTime(DateTime.now());
  }

  /// Copy this date object with some fields changed
  ///
  /// Original date object remains unchanged
  ///
  /// You can leave out items for not changing them
  ///
  /// This method is NOT safe
  ///
  /// This method does change all fields at once,
  /// Not individually in a order
  ///
  /// Throws DateException on problems
  ///
  /// Note: For ordering use with*() methods
  @override
  Gregorian copy({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
  }) {
    if (year == null &&
        month == null &&
        day == null &&
        hour == null &&
        minute == null &&
        second == null &&
        millisecond == null) {
      return this;
    } else {
      return Gregorian(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
      );
    }
  }

  /// Converts Gregorian date to [DateTime] object
  @override
  DateTime toDateTime() {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// Converts Gregorian date to [DateTime] object
  @override
  DateTime toUtcDateTime() {
    return DateTime.utc(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// Converts a Gregorian date to Jalali.
  Jalali toJalali() {
    return Jalali.fromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// Checks if a year is a leap year or not.
  @override
  bool isLeapYear() {
    return _Algo.isLeapYear(year);
  }

  /// Default string representation: `Gregorian(year, month, ...)`.
  /// use formatter for custom formatting.
  @override
  String toString() {
    return 'Gregorian($year, $month, $day, $hour, '
        '$minute, $second, $millisecond)';
  }

  /// Add [days]
  ///
  /// Original date object remains unchanged
  ///
  /// This Method is safe
  ///
  /// Note: This is same as addDays(days)
  @override
  Gregorian operator +(int days) {
    return addDays(days);
  }

  /// Subtract [days]
  ///
  /// Original date object remains unchanged
  ///
  /// This Method is safe
  ///
  /// Note: This is same as addDays(-days)
  @override
  Gregorian operator -(int days) {
    return addDays(-days);
  }

  /// makes a new date instance and
  /// add [days], [months] and [years] separately
  ///
  /// Original date object remains unchanged
  ///
  /// Note: It does not make any conversion,
  /// it simply adds to each field value and changes ALL at once
  ///
  /// This Method is NOT safe for month and day bounds
  ///
  /// Recommended: Use separate add*() methods
  @override
  Gregorian add({
    int years = 0,
    int months = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
  }) {
    if (years == 0 &&
        months == 0 &&
        days == 0 &&
        hours == 0 &&
        minutes == 0 &&
        seconds == 0 &&
        milliseconds == 0) {
      return this;
    } else {
      return Gregorian(
        year + years,
        month + months,
        day + days,
        hour + hours,
        minute + minutes,
        second + seconds,
        millisecond + milliseconds,
      );
    }
  }

  /// Makes a new date object with
  /// added [years] to this date
  ///
  /// Original date object remains unchanged
  ///
  /// This method is safe
  @override
  Gregorian addYears(int years) {
    if (years == 0) {
      return this;
    } else {
      return Gregorian(
        year + years,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  /// Makes a new date object with
  /// added [months] to this date
  ///
  /// Original date object remains unchanged
  ///
  /// This method is NOT safe for day being out of month length,
  /// But is safe for month overflow
  ///
  /// Throws DateException on problems
  @override
  Gregorian addMonths(int months) {
    if (months == 0) {
      return this;
    } else {
      // this is fast enough, no need for further optimization
      final int sum = month + months - 1;
      final int mod = sum % 12;
      // can not use "sum ~/ 12" directly
      final int deltaYear = (sum - mod) ~/ 12;

      return Gregorian(
        year + deltaYear,
        mod + 1,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  /// makes a new date object with
  /// added [days] to this date
  ///
  /// Original date object remains unchanged
  ///
  /// this Method is safe
  @override
  Gregorian addDays(int days) {
    if (days == 0) {
      return this;
    } else {
      return Gregorian.fromJulianDayNumber(
        julianDayNumber + days,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  /// Make a new date object with changed [year]
  ///
  /// Original date object remains unchanged
  ///
  /// This method is NOT safe
  ///
  /// Throws DateException on problems
  ///
  /// Note: For changing at once use copy() methods
  ///
  /// Note: You can chain methods
  @override
  Gregorian withYear(int year) {
    if (year == this.year) {
      return this;
    } else {
      return Gregorian(
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

  /// Make a new date object with changed [month]
  ///
  /// Original date object remains unchanged
  ///
  /// This method is NOT safe
  ///
  /// Throws DateException on problems
  ///
  /// Note: For changing at once use copy() methods
  ///
  /// Note: You can chain methods
  @override
  Gregorian withMonth(int month) {
    if (month == this.month) {
      return this;
    } else {
      return Gregorian(
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

  /// Make a new date object with changed [day]
  ///
  /// Original date object remains unchanged
  ///
  /// This method is NOT safe
  ///
  /// Throws DateException on problems
  ///
  /// Note: For changing at once use copy() methods
  ///
  /// Note: You can chain methods
  @override
  Gregorian withDay(int day) {
    if (day == this.day) {
      return this;
    } else {
      return Gregorian(
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
}
