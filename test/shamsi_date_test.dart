import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  test('toJalali should convert Date object to Jalali', () {
    expect(Gregorian(1981, 8, 17).toJalali().toString(),
        Jalali(1360, 5, 26).toString());
    expect(Gregorian(2013, 1, 10).toJalali().toString(),
        Jalali(1391, 10, 21).toString());
    expect(Gregorian(2014, 8, 4).toJalali().toString(),
        Jalali(1393, 5, 13).toString());
  });

  test('toGregorian should convert Jalali to Gregorian correctly', () {
    expect(Jalali(1360, 5, 26).toGregorian().toString(),
        Gregorian(1981, 8, 17).toString());
    expect(Jalali(1391, 10, 21).toGregorian().toString(),
        Gregorian(2013, 1, 10).toString());
    expect(Jalali(1393, 5, 13).toGregorian().toString(),
        Gregorian(2014, 8, 4).toString());
  });

  test('isValid should check validity of a Jalali date', () {
    expect(Jalali(-62, 12, 29).isValid(), false);
    expect(Jalali(-62, 12, 29).isValid(), false);
    expect(Jalali(-61, 1, 1).isValid(), true);
    expect(Jalali(3178, 1, 1).isValid(), false);
    expect(Jalali(3177, 12, 29).isValid(), true);
    expect(Jalali(1393, 0, 1).isValid(), false);
    expect(Jalali(1393, 13, 1).isValid(), false);
    expect(Jalali(1393, 1, 0).isValid(), false);
    expect(Jalali(1393, 1, 32).isValid(), false);
    expect(Jalali(1393, 1, 31).isValid(), true);
    expect(Jalali(1393, 11, 31).isValid(), false);
    expect(Jalali(1393, 11, 30).isValid(), true);
    expect(Jalali(1393, 12, 30).isValid(), false);
    expect(Jalali(1393, 12, 29).isValid(), true);
    expect(Jalali(1395, 12, 30).isValid(), true);
  });

  test('isLeapYear should check if a Jalali year is leap or common', () {
    expect(Jalali(1393).isLeapYear(), false);
    expect(Jalali(1394).isLeapYear(), false);
    expect(Jalali(1395).isLeapYear(), true);
    expect(Jalali(1396).isLeapYear(), false);
  });

  test('monthLength test should return month length', () {
    expect(Jalali(1393, 1).monthLength, 31);
    expect(Jalali(1393, 4).monthLength, 31);
    expect(Jalali(1393, 6).monthLength, 31);
    expect(Jalali(1393, 7).monthLength, 30);
    expect(Jalali(1393, 10).monthLength, 30);
    expect(Jalali(1393, 12).monthLength, 29);
    expect(Jalali(1394, 12).monthLength, 29);
    expect(Jalali(1395, 12).monthLength, 30);
  });

  test('Gregorian weekDay should retrun week day number', () {
    expect(Gregorian(1969, 7, 20).weekDay, 7);
    expect(Gregorian(2019, 1, 14).weekDay, 1);
    expect(Gregorian(2019, 1, 10).weekDay, 4);
  });

  test('Gregorian weekDay should retrun week day number', () {
    expect(Jalali(1397, 10, 24).weekDay, 3);
    expect(Jalali(1397, 10, 11).weekDay, 4);
    expect(Jalali(1305, 1, 5).weekDay, 7);
    expect(Jalali(1305, 1, 6).weekDay, 1);
  });
}
