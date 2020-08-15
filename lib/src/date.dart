// Copyright 2018 - 2020, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library date;

import 'date_formatter.dart';

/// Super interface of Jalali and Georgian classes
abstract class Date {
  /// year
  ///
  /// non-null
  int get year;

  /// month
  ///
  /// non-null
  int get month;

  /// day
  ///
  /// non-null
  int get day;

  /// julian day number
  ///
  /// non-null
  int get julianDayNumber;

  /// week day number
  ///
  /// non-null
  int get weekDay;

  /// month length
  ///
  /// non-null
  int get monthLength;

  /// Formatter for this date object
  ///
  /// non-null
  DateFormatter get formatter;

  /// checks if this year is a leap year
  ///
  /// non-null
  bool isLeapYear();

  /// checks if is valid
  ///
  /// non-null
  bool isValid();
}
