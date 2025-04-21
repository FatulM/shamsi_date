// Copyright 2018 - 2025, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'date.dart';

/// super class for Jalali and Gregorian Date formatter
abstract class DateFormatter {
  /// stored date
  final Date date;

  /// make a [DateFormatter] for a [Date] object
  const DateFormatter(this.date);

  /// year number string whatever length it has
  ///
  /// [date.year] should be greater or equal 0 or exception will be thrown
  String get y {
    final int year = date.year;

    if (year < 0) {
      throw StateError('date.year = $year < 0');
    }

    return year.toString();
  }

  /// year number string ensured to have length of 4
  ///
  /// [date.year] should be between 0 and 9999 or exception will be thrown
  String get yyyy {
    final int year = date.year;

    if (year < 0) {
      throw StateError('date.year = $year < 0');
    }

    if (year > 9999) {
      throw StateError('date.year = $year > 9999');
    }

    return year.toString().padLeft(4, '0');
  }

  /// year number string ensured to have length of 2
  ///
  /// [date.year] should be between 1000 and 9999 or exception is thrown
  String get yy {
    final int year = date.year;

    if (year < 1000) {
      throw StateError('date.year = $year < 1000');
    }

    if (year > 9999) {
      throw StateError('date.year = $year > 9999');
    }

    return (year % 100).toString().padLeft(2, '0');
  }

  /// month number string whatever length it has
  String get m {
    return date.month.toString();
  }

  /// month number string ensured to have length of 2
  String get mm {
    return date.month.toString().padLeft(2, '0');
  }

  /// month name
  String get mN;

  /// day number string whatever length it has
  String get d {
    return date.day.toString();
  }

  /// day number string ensured to have length of 2
  String get dd {
    return date.day.toString().padLeft(2, '0');
  }

  /// week day name
  String get wN;

  /// hour
  String get tH {
    return date.hour.toString();
  }

  /// hour - 2 digit
  String get tHH {
    return date.hour.toString().padLeft(2, '0');
  }

  /// minute
  String get tM {
    return date.minute.toString();
  }

  /// minute - 2 digit
  String get tMM {
    return date.minute.toString().padLeft(2, '0');
  }

  /// second
  String get tS {
    return date.second.toString();
  }

  /// second - 2 digit
  String get tSS {
    return date.second.toString().padLeft(2, '0');
  }

  /// Milliseconds
  String get tMS {
    return date.millisecond.toString();
  }

  /// Milliseconds - 3 digit
  String get tMSSS {
    return date.millisecond.toString().padLeft(3, '0');
  }
}
