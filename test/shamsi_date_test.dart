import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  test('toJalali should convert Date object to Jalali', () {
    expect(Gregorian(year: 1981, month: 8, day: 17).toJalali().toString(),
        Jalali(year: 1360, month: 5, day: 26).toString());
    expect(Gregorian(year: 2013, month: 1, day: 10).toJalali().toString(),
        Jalali(year: 1391, month: 10, day: 21).toString());
  });

  test('toGregorian should convert Jalali to Gregorian correctly', () {
    expect(Jalali(year: 1360, month: 5, day: 26).toGregorian().toString(),
        Gregorian(year: 1981, month: 8, day: 17).toString());
    expect(Jalali(year: 1391, month: 10, day: 21).toGregorian().toString(),
        Gregorian(year: 2013, month: 1, day: 10).toString());
  });

  test('isValid should check validity of a Jalali date', () {
    expect(Jalali(year: -62, month: 12, day: 29).isValid(), false);
    expect(Jalali(year: 1393, month: 11, day: 30).isValid(), true);
    expect(Jalali(year: 1393, month: 11, day: 31).isValid(), false);
  });

  test('isLeapYear should check if a Jalali year is leap or common', () {
    expect(Jalali.isLeapYear(1395), true);
    expect(Jalali.isLeapYear(1396), false);
  });

  test('monthLength test should return month length', () {
    expect(Jalali.monthLength(year: 1393, month: 1), 31);
    expect(Jalali.monthLength(year: 1394, month: 12), 29);
  });
}
