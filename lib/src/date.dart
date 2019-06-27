// Copyright 2018 - 2019, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library date;

import 'package:shamsi_date/src/date_formatter.dart';

/// Super interface of Jalali and Georgian classes
abstract class Date {
  /// Year
  int get year;

  /// Month
  int get month;

  /// Day
  int get day;

  /// Julian Day Number
  int get julianDayNumber;

  /// Week day number
  int get weekDay;

  /// Formatter for this date object
  DateFormatter get formatter;
}
