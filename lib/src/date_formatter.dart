// Copyright 2018 - 2019, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library date_formatter;

import 'package:shamsi_date/src/date.dart';

/// Super interface for Jalali and Gregorian Date formatter
abstract class DateFormatter {
  /// Stored date
  final Date date;

  /// Make a formatter for a date object
  DateFormatter(this.date);

  /// Year number string whatever length it has
  String get y => '${date.year}';

  /// Year number string ensured to have length of 4
  String get yyyy {
    final str = this.y;
    final zeros = List.filled(4 - str.length, '0').join();
    return zeros + str;
  }

  /// Year number string ensured to have length of 2
  String get yy {
    final str = '${date.year % 100}';
    return str.length == 1 ? '0' + str : str;
  }

  /// Month number string whatever length it has
  String get m => '${date.month}';

  /// Month number string ensured to have length of 2
  String get mm {
    final str = m;
    return str.length == 1 ? '0' + str : str;
  }

  /// Month name
  String get mN;

  /// Day number string whatever length it has
  String get d => '${date.day}';

  /// Day number string ensured to have length of 2
  String get dd {
    final str = d;
    return str.length == 1 ? '0' + str : str;
  }

  /// Week day name
  String get wN;
}
