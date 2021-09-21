// Copyright 2018 - 2021, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'date_formatter.dart';

/// Super class of Jalali and Georgian classes
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
abstract class Date implements Comparable<Date> {
  const Date();

  /// Minimum computable julian day number
  ///
  /// Equivalent to Gregorian(560,3,20) and Jalali(-61,1,1)
  /// and julian day number of 1925675
  static const int minJulianDayNumber = 1925675;

  /// Maximum computable julian day number
  ///
  /// Equivalent to Gregorian(3798,12,31) and Jalali(3177,10,11)
  /// and julian day number of 3108616
  static const int maxJulianDayNumber = 3108616;

  /// Year
  int get year;

  /// Month
  int get month;

  /// Day
  int get day;

  /// Julian day number
  ///
  /// subclasses should store this with fast access
  int get julianDayNumber;

  /// Week day number
  ///
  /// Starting with 1 and ending in 7
  int get weekDay;

  /// Month length
  int get monthLength;

  /// create a formatter for this date object
  ///
  /// Date formatter should be also immutable
  DateFormatter get formatter;

  /// Checks if a year is a leap year or not
  bool isLeapYear();

  /// Converts date to [DateTime] object
  DateTime toDateTime([
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]);

  /// Converts date to UTC [DateTime] object
  DateTime toUTCDateTime([
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]);

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
  Date copy({int? year, int? month, int? day});

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
  Date withYear(int year);

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
  Date withMonth(int month);

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
  Date withDay(int day);

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
  Date add({int years = 0, int months = 0, int days = 0});

  /// Makes a new date object with
  /// added [years] to this date
  ///
  /// Original date object remains unchanged
  ///
  /// This method is safe
  Date addYears(int years);

  /// Makes a new date object with
  /// added [months] to this date
  ///
  /// This method is NOT safe for day being out of month length,
  /// But is safe for month overflow
  ///
  /// Throws DateException on problems
  Date addMonths(int months);

  /// makes a new date object with
  /// added [days] to this date
  ///
  /// Original date object remains unchanged
  ///
  /// this Method is safe
  Date addDays(int days);

  /// Add [days]
  ///
  /// Original date object remains unchanged
  ///
  /// This Method is safe
  ///
  /// Note: This is same as addDays(days)
  Date operator +(int days);

  /// Subtract [days]
  ///
  /// Original date object remains unchanged
  ///
  /// This Method is safe
  ///
  /// Note: This is same as addDays(-days)
  Date operator -(int days);

  /// Subclasses should implement toString
  ///
  /// It should be SUBCLASS_NAME(year, month, day)
  ///
  /// Note: Use formatter for formatting dates for UI
  @override
  String toString();

  /// distance between two dates
  ///
  /// (we use this operator since we used operator [-]
  /// for subtracting days)
  ///
  /// `d1 ^ d2` is mathematically equivalent to `d1 minus d2`
  int operator ^(Date other) {
    return julianDayNumber - other.julianDayNumber;
  }

  /// distance between two dates
  ///
  /// `d1.distanceTo(d2)` is equivalent to `d2 ^ d1`
  /// and mathematically equivalent to `d1 minus d2`
  int distanceTo(Date other) {
    return other.julianDayNumber - julianDayNumber;
  }

  /// distance between two dates
  ///
  /// `d1.distanceFrom(d2)` is equivalent to `d1 ^ d2`
  /// and mathematically equivalent to `d1 minus d2`
  int distanceFrom(Date other) {
    return julianDayNumber - other.julianDayNumber;
  }

  /// equals operator
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Date && julianDayNumber == other.julianDayNumber;
  }

  /// hashcode operator
  @override
  int get hashCode {
    return julianDayNumber.hashCode;
  }

  /// Compare dates
  @override
  int compareTo(Date other) {
    return julianDayNumber.compareTo(other.julianDayNumber);
  }

  /// bigger than operator
  bool operator >(Date other) {
    return julianDayNumber > other.julianDayNumber;
  }

  /// bigger than or equal operator
  bool operator >=(Date other) {
    return julianDayNumber >= other.julianDayNumber;
  }

  /// less than operator
  bool operator <(Date other) {
    return julianDayNumber < other.julianDayNumber;
  }

  /// less than or equal operator
  bool operator <=(Date other) {
    return julianDayNumber <= other.julianDayNumber;
  }
}
