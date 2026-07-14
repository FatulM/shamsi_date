// Copyright 2018 - 2026, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// A package for Jalali (Shamsi, Solar, Persian, Iranian, Jalaali or شمسی) calendar.
/// Convert, format and manipulate Jalali and Gregorian (Miladi) dates.
///
/// ## Quick Start
///
/// ```dart
/// import 'package:shamsi_date/shamsi_date.dart';
///
/// // Create dates
/// Jalali j = Jalali(1403, 5, 15);
/// Gregorian g = Gregorian(2024, 8, 5);
///
/// // Convert between calendars
/// Gregorian j2g = j.toGregorian();
/// Jalali g2j = g.toJalali();
///
/// // Format dates
/// String formatted = '${j.formatter.yyyy}/${j.formatter.mm}/${j.formatter.dd}';
/// ```
///
/// ## Features
///
/// - Jalali and Gregorian calendar support
/// - Calendar conversion and date arithmetic
/// - Powerful date formatting
/// - Time information support
/// - Immutable date objects
/// - Null-safe API
library shamsi_date;

export 'src/date.dart';
export 'src/date_exception.dart';
export 'src/date_formatter.dart';
export 'src/extensions/date_time_extensions.dart';
export 'src/gregorian/gregorian_date.dart';
export 'src/gregorian/gregorian_formatter.dart';
export 'src/jalali/jalali_date.dart';
export 'src/jalali/jalali_formatter.dart';
