// Copyright 2018 - 2020, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library gregorian_formatter;

import 'package:shamsi_date/src/date_formatter.dart';
import 'package:shamsi_date/src/gregorian/gregorian_date.dart';

/// Gregorian date formatter class
class GregorianFormatter extends DateFormatter {
  /// make a [GregorianFormatter] from [Gregorian] date
  ///
  /// argument should not be null
  GregorianFormatter(Gregorian date) : super(date);

  /// Gregorian month names
  static const List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Gregorian week day names
  static const List<String> _weekDayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  /// Gregorian month name
  ///
  /// Non-Null
  @override
  String get mN {
    return _monthNames[date.month - 1];
  }

  /// Gregorian week day name
  ///
  /// Non-Null
  @override
  String get wN {
    return _weekDayNames[date.weekDay - 1];
  }
}
