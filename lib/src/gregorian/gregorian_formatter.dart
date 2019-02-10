library gregorian_formatter;

import 'package:shamsi_date/src/date_formatter.dart';
import 'package:shamsi_date/src/gregorian/gregorian_date.dart';

/// Gregorian date formatter class
class GregorianFormatter extends DateFormatter {
  GregorianFormatter(Gregorian date) : super(date);

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
  @override
  String get mN => _monthNames[date.month - 1];

  /// Gregorian week day name
  @override
  String get wN => _weekDayNames[date.weekDay - 1];
}
