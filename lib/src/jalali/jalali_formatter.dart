// Copyright 2018 - 2020, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library jalali_formatter;

import 'package:shamsi_date/src/date_formatter.dart';
import 'package:shamsi_date/src/jalali/jalali_date.dart';

/// Jalali date formatter class
class JalaliFormatter extends DateFormatter {
  /// make a [JalaliFormatter] from [Jalali] date
  ///
  /// argument should not be null
  JalaliFormatter(Jalali date) : super(date);

  /// Jalali month names
  static const List<String> _monthNames = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  /// Jalali week day names
  static const List<String> _weekDayNames = [
    'شنبه',
    'یک شنبه',
    'دو شنبه',
    'سه شنبه',
    'چهار شنبه',
    'پنج شنبه',
    'جمعه',
  ];

  /// Jalali month name
  ///
  /// Non-Null
  @override
  String get mN {
    return _monthNames[date.month - 1];
  }

  /// Jalali week day name
  ///
  /// Non-Null
  @override
  String get wN {
    return _weekDayNames[date.weekDay - 1];
  }
}
