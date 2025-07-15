import '../gregorian/gregorian_date.dart';
import '../jalali/jalali_date.dart';

/// extension methods to easily convert [DateTime] to [Jalali] and [Gregorian]
extension DateTimeExtensions on DateTime {
  /// convert [DateTime] to [Jalali]
  Jalali toJalali() {
    return Jalali.fromDateTime(this);
  }

  /// convert [DateTime] to [Gregorian]
  Gregorian toGregorian() {
    return Gregorian.fromDateTime(this);
  }
}
