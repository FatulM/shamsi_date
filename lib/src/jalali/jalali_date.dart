// Copyright 2018 - 2024, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../date.dart';
import '../date_exception.dart';
import '../gregorian/gregorian_date.dart';
import '../jalali/jalali_formatter.dart';

part 'jalali_calculation.dart';

/// Jalali (Jalaali, Shamsi or Persian) Date class
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
class Jalali extends Date {
  /// Minimum computable Jalali date
  ///
  /// equivalent to Gregorian(560,3,20) and Jalali(-61,1,1)
  /// and julian day number of 1925675
  static const Jalali min = Jalali._raw(1925675, -61, 1, 1, 0, 0, 0, 0, true);

  /// Maximum computable Jalali date
  ///
  /// equivalent to Gregorian(3798,12,31) and Jalali(3177,10,11)
  /// and julian day number of 3108616
  static const Jalali max =
      Jalali._raw(3108616, 3177, 10, 11, 23, 59, 59, 999, false);

  /// Internal constructor without any checks whatsoever
  const Jalali._raw(
    this.julianDayNumber,
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this._isLeap,
  );

  /// Julian Day Number
  @override
  final int julianDayNumber;

  /// Jalali year (1 to 3100)
  @override
  final int year;

  /// Jalali month (1 to 12)
  @override
  final int month;

  /// Jalali day (1 to 29/31)
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

  /// Whether is leap year.
  ///
  /// It is cached since we always calculate it
  /// and it has long calculation.
  final bool _isLeap;

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
      return _isLeap ? 30 : 29;
    }
  }

  /// Formatter for this date object
  ///
  /// Date formatter is also immutable
  @override
  JalaliFormatter get formatter {
    return JalaliFormatter(this);
  }

  /// Create a Gregorian date by using [year], [month] and [day]
  ///
  /// year and month default to 1
  factory Jalali(
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

  /// Converts the Julian Day number to a date in the Jalali calendar.
  factory Jalali.fromJulianDayNumber(
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

  /// Create a Jalali date by using [DateTime] object
  factory Jalali.fromDateTime(DateTime dateTime) {
    return Gregorian.fromDateTime(dateTime).toJalali();
  }

  /// Create a Jalali date from Gregorian date
  factory Jalali.fromGregorian(Gregorian date) {
    return Jalali.fromJulianDayNumber(
      date.julianDayNumber,
      date.hour,
      date.minute,
      date.second,
      date.millisecond,
    );
  }

  /// Create a Jalali date from milliseconds since epoch
  ///
  /// If [isUtc] is false then the date is in the local time zone
  factory Jalali.fromMillisecondsSinceEpoch(
    int milliseconds, {
    bool isUtc = false,
  }) {
    return Jalali.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(
        milliseconds,
        isUtc: isUtc,
      ),
    );
  }

  /// Get Jalali date for now
  factory Jalali.now() {
    return Gregorian.now().toJalali();
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
  Jalali copy({
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
      return Jalali(
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

  /// Converts Jalali date to [DateTime] object
  @override
  DateTime toDateTime() {
    return toGregorian().toDateTime();
  }

  /// Converts Jalali date to [DateTime] object
  @override
  DateTime toUtcDateTime() {
    return toGregorian().toUtcDateTime();
  }

  /// Converts a Jalali date to Gregorian.
  Gregorian toGregorian() {
    return Gregorian.fromJulianDayNumber(
      julianDayNumber,
      hour,
      minute,
      second,
      millisecond,
    );
  }

  /// Checks if a year is a leap year or not
  @override
  bool isLeapYear() {
    return _isLeap;
  }

  /// Default string representation: `Jalali(year, month, ...)`.
  /// use formatter for custom formatting.
  @override
  String toString() {
    return 'Jalali($year, $month, $day, $hour, '
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
  Jalali operator +(int days) {
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
  Jalali operator -(int days) {
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
  Jalali add({
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
      return Jalali(
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
  Jalali addYears(int years) {
    if (years == 0) {
      return this;
    } else {
      return Jalali(
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
  Jalali addMonths(int months) {
    if (months == 0) {
      return this;
    } else {
      // this is fast enough, no need for further optimization
      final int sum = month + months - 1;
      final int mod = sum % 12;
      // can not use "sum ~/ 12" directly
      final int deltaYear = (sum - mod) ~/ 12;

      return Jalali(
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
  Jalali addDays(int days) {
    if (days == 0) {
      return this;
    } else {
      return Jalali.fromJulianDayNumber(
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
  Jalali withYear(int year) {
    if (year == this.year) {
      return this;
    } else {
      return Jalali(
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
  Jalali withMonth(int month) {
    if (month == this.month) {
      return this;
    } else {
      return Jalali(
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
  Jalali withDay(int day) {
    if (day == this.day) {
      return this;
    } else {
      return Jalali(
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
