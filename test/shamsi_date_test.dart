import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  test('toJalali should convert Date object to Jalali', () {
    expect(Gregorian(1981, 8, 17).toJalali().toString(),
        Jalali(1360, 5, 26).toString());
    expect(Gregorian(2013, 1, 10).toJalali().toString(),
        Jalali(1391, 10, 21).toString());
  });

  test('toGregorian should convert Jalali to Gregorian correctly', () {
    expect(Jalali(1360, 5, 26).toGregorian().toString(),
        Gregorian(1981, 8, 17).toString());
    expect(Jalali(1391, 10, 21).toGregorian().toString(),
        Gregorian(2013, 1, 10).toString());
  });

  test('isValid should check validity of a Jalali date', () {
    expect(Jalali(-62, 12, 29).isValid(), false);
    expect(Jalali(1393, 11, 30).isValid(), true);
    expect(Jalali(1393, 11, 31).isValid(), false);
  });

  test('isLeapYear should check if a Jalali year is leap or common', () {
    expect(Jalali.isLeapYear(1395), true);
    expect(Jalali.isLeapYear(1396), false);
  });

  test('monthLength test should return month length', () {
    expect(Jalali.monthLength(1393, 1), 31);
    expect(Jalali.monthLength(1394, 12), 29);
  });
}
