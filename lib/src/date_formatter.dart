// Copyright 2018 - 2020, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library date_formatter;

import 'package:shamsi_date/src/date.dart';

/// super interface for Jalali and Gregorian Date formatter
abstract class DateFormatter {
  /// stored date
  final Date date;

  /// make a formatter for a date object
  DateFormatter(this.date) {
    ArgumentError.checkNotNull(date, 'date');
  }

  /// year number string whatever length it has
  /// [date.year] should be greater or equal 0 or exception will be thrown
  String get y {
    final year = date.year;

    if (year < 0) {
      throw StateError('date.year = $year < 0');
    }

    return '$year';
  }

  /// year number string ensured to have length of 4
  /// [date.year] should be between 0 and 9999 or exception will be thrown
  String get yyyy {
    final year = date.year;

    if (year < 0) {
      throw StateError('date.year = $year < 0');
    }

    if (year > 9999) {
      throw StateError('date.year = $year > 9999');
    }

    final str = '$year';

    switch (str.length) {
      case 4:
        return str;
      case 3:
        return '0$str';
      case 2:
        return '00$str';
      case 1:
        return '000$str';
      default: // case: 0
        return '0000';
    }
  }

  /// year number string ensured to have length of 2
  /// [date.year] should be between 1000 and 9999 or exception is thrown
  String get yy {
    final year = date.year;

    if (year < 1000) {
      throw StateError("date.year = $year < 1000");
    }

    if (year > 9999) {
      throw StateError("date.year = $year > 9999");
    }

    final str = '${year % 100}';
    return str.length == 1 ? '0' + str : str;
  }

  /// month number string whatever length it has
  String get m {
    return '${date.month}';
  }

  /// month number string ensured to have length of 2
  String get mm {
    final str = m;
    return str.length == 1 ? '0' + str : str;
  }

  /// month name
  String get mN;

  /// day number string whatever length it has
  String get d {
    return '${date.day}';
  }

  /// day number string ensured to have length of 2
  String get dd {
    final str = d;
    return str.length == 1 ? '0' + str : str;
  }

  /// week day name
  String get wN;
}
