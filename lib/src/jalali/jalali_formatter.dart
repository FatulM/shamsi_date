// Copyright 2018 - 2025, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../date_formatter.dart';
import '../jalali/jalali_date.dart';

/// Jalali date formatter class
class JalaliFormatter extends DateFormatter {
  /// make a [JalaliFormatter] from [Jalali] date
  const JalaliFormatter(Jalali date) : super(date);

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

  /// Jalali month names in Finglish
  static const List<String> _monthNamesFinglish = [
    'Farvardin',
    'Ordibehesht',
    'Khordad',
    'Tir',
    'Mordad',
    'Shahrivar',
    'Mehr',
    'Aban',
    'Azar',
    'Dey',
    'Bahman',
    'Esfand',
  ];

  /// Jalali Month Names in Afghanistan
  static const List<String> _monthNamesAfghanistan = [
    'حمل',
    'ثور',
    'جوزا',
    'سرطان',
    'اسد',
    'سنبله',
    'میزان',
    'عقرب',
    'قوس',
    'جدی',
    'دلو',
    'حوت',
  ];

  /// Jalali week day names
  static const List<String> _weekDayNames = [
    'شنبه',
    'یکشنبه',
    'دوشنبه',
    'سه‌شنبه',
    'چهارشنبه',
    'پنجشنبه',
    'جمعه',
  ];

  /// Jalali week day names in Finglish
  static const List<String> _weekDayNamesFinglish = [
    'Shanbeh',
    'Yekshanbeh',
    'Doshanbeh',
    'Seshanbeh',
    'Chaharshanbeh',
    'Panjshanbeh',
    'Jomeh',
  ];

  /// Jalali month name
  @override
  String get mN {
    return _monthNames[date.month - 1];
  }

  /// Jalali month names in Finglish
  String get mNFn {
    return _monthNamesFinglish[date.month - 1];
  }

  /// Jalali month name in Afghanistan
  String get mNAf {
    return _monthNamesAfghanistan[date.month - 1];
  }

  /// Jalali week day name
  @override
  String get wN {
    return _weekDayNames[date.weekDay - 1];
  }

  /// Jalali week day name in Finglish
  String get wNFn {
    return _weekDayNamesFinglish[date.weekDay - 1];
  }

  /// Default date Seperator = `/`
  @override
  String get sep {
    return '/';
  }
}
