library jalali_formatter;

import 'package:shamsi_date/src/date_formatter.dart';
import 'package:shamsi_date/src/jalali/jalali_date.dart';

/// Jalali date formatter class
class JalaliFormatter extends DateFormatter {
  /// make a [JalaliFormatter] from [Jalali] date
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
  @override
  String get mN => _monthNames[date.month - 1];

  /// Jalali week day name
  @override
  String get wN => _weekDayNames[date.weekDay - 1];
}
