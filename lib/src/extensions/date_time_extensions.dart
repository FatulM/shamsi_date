import '../gregorian/gregorian_date.dart';
import '../jalali/jalali_date.dart';

/// extension methods to easily convert [DateTime] to [Jalali] and [Gregorian]
extension DateTimeExtensions on DateTime {
  /// convert [DateTime] to [Jalali]
  Jalali toJalali() => Jalali.fromDateTime(this);

  /// convert [DateTime] to [Gregorian]
  Gregorian toGregorian() => Gregorian.fromDateTime(this);
}
