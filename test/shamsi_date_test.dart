import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  test('Jalali.fromJulianDayNumber should work correctly', () {
    expect(Jalali
        .fromJulianDayNumber(2400000)
        .julianDayNumber, 2400000);
    expect(Jalali
        .fromJulianDayNumber(2458605)
        .julianDayNumber, 2458605);
    expect(Jalali
        .fromJulianDayNumber(2500000)
        .julianDayNumber, 2500000);
  });

  test('Gregorian.fromJulianDayNumber should work correctly', () {
    expect(Gregorian
        .fromJulianDayNumber(2400000)
        .julianDayNumber, 2400000);
    expect(Gregorian
        .fromJulianDayNumber(2458605)
        .julianDayNumber, 2458605);
    expect(Gregorian
        .fromJulianDayNumber(2500000)
        .julianDayNumber, 2500000);
  });

  test('toJalali should convert Date object to Jalali', () {
    expect(Gregorian(1981, 8, 17).toJalali().toString(),
        Jalali(1360, 5, 26).toString());
    expect(Gregorian(2013, 1, 10).toJalali().toString(),
        Jalali(1391, 10, 21).toString());
    expect(Gregorian(2014, 8, 4).toJalali().toString(),
        Jalali(1393, 5, 13).toString());

    expect(Jalali.fromGregorian(Gregorian(1981, 8, 17)).toString(),
        Jalali(1360, 5, 26).toString());
  });

  test('toGregorian should convert Jalali to Gregorian correctly', () {
    expect(Jalali(1360, 5, 26).toGregorian().toString(),
        Gregorian(1981, 8, 17).toString());
    expect(Jalali(1391, 10, 21).toGregorian().toString(),
        Gregorian(2013, 1, 10).toString());
    expect(Jalali(1393, 5, 13).toGregorian().toString(),
        Gregorian(2014, 8, 4).toString());

    expect(Gregorian.fromJalali(Jalali(1360, 5, 26)).toString(),
        Gregorian(1981, 8, 17).toString());
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

  test('Jalali comparison should be correct', () {
    final j1 = Jalali(1397, 10, 24);
    final j2 = Jalali(1397, 10, 25);
    final j3 = Jalali(1397, 12, 1);
    final j4 = Jalali(1399, 1, 1);

    expect(j1.compareTo(j1) == 0, true);
    expect(j1.compareTo(j2) < 0, true);
    expect(j1.compareTo(j3) < 0, true);
    expect(j2.compareTo(j3) < 0, true);
    expect(j1.compareTo(j4) < 0, true);
    expect(j2.compareTo(j4) < 0, true);
    expect(j3.compareTo(j4) < 0, true);
    expect(j2.compareTo(j1) > 0, true);
    expect(j4.compareTo(j1) > 0, true);

    expect(j1 == j1, true);
    expect(Jalali(j1.year, j1.month, j1.day) == j1, true);
    expect(j1 > j3, false);
    expect(j1 >= j3, false);
    expect(j3 > j1, true);
    expect(j3 < j1, false);
    expect(j3 <= j1, false);
    expect(j1 < j3, true);
  });

  test('Gregorian comparison should be correct', () {
    final g1 = Gregorian(2017, 10, 24);
    final g2 = Gregorian(2017, 10, 25);
    final g3 = Gregorian(2017, 12, 1);
    final g4 = Gregorian(2018, 1, 1);

    expect(g1.compareTo(g1) == 0, true);
    expect(g1.compareTo(g2) < 0, true);
    expect(g1.compareTo(g3) < 0, true);
    expect(g2.compareTo(g3) < 0, true);
    expect(g1.compareTo(g4) < 0, true);
    expect(g2.compareTo(g4) < 0, true);
    expect(g3.compareTo(g4) < 0, true);
    expect(g2.compareTo(g1) > 0, true);
    expect(g4.compareTo(g1) > 0, true);

    expect(g1 == g1, true);
    expect(Gregorian(g1.year, g1.month, g1.day) == g1, true);
    expect(g1 > g3, false);
    expect(g1 >= g3, false);
    expect(g3 > g1, true);
    expect(g3 < g1, false);
    expect(g3 <= g1, false);
    expect(g1 < g3, true);
  });

  test('Jalali formatter should work as expected', () {
    final j1 = Jalali(1397, 1, 3);
    final f1 = j1.formatter;

    expect(f1.yyyy, '1397');
    expect(f1.yy, '97');
    expect(f1.y, '1397');
    expect(f1.mm, '01');
    expect(f1.m, '1');
    expect(f1.dd, '03');
    expect(f1.d, '3');
    expect(f1.mN, 'فروردین');
    expect(f1.wN, 'جمعه');

    final j2 = Jalali(1397, 10, 28);
    final f2 = j2.formatter;

    expect(f2.mm, '10');
    expect(f2.m, '10');
    expect(f2.dd, '28');
    expect(f2.d, '28');
  });

  test('Gregorian formatter should work as expected', () {
    final g1 = Gregorian(2007, 1, 3);
    final f1 = g1.formatter;

    expect(f1.yyyy, '2007');
    expect(f1.yy, '07');
    expect(f1.y, '2007');
    expect(f1.mm, '01');
    expect(f1.m, '1');
    expect(f1.dd, '03');
    expect(f1.d, '3');
    expect(f1.mN, 'January');
    expect(f1.wN, 'Wednesday');

    final g2 = Gregorian(2018, 10, 28);
    final f2 = g2.formatter;

    expect(f2.mm, '10');
    expect(f2.m, '10');
    expect(f2.dd, '28');
    expect(f2.d, '28');
  });

  test('Jalali copy method should copy dates correctly', () {
    expect(Jalali(1395, 10, 21).copy().toString(), "1395/10/21");

    expect(Jalali(1395, 10, 21).copy(year: 1390, day: 10).toString(),
        "1390/10/10");

    expect(Jalali(1395, 10, 21).copy(month: 5).toString(), "1395/5/21");
  });

  test('Gregorian copy method should copy dates correctly', () {
    expect(Gregorian(2018, 10, 21).copy().toString(), "2018/10/21");

    expect(Gregorian(2018, 10, 21).copy(year: 2000, day: 10).toString(),
        "2000/10/10");

    expect(Gregorian(2018, 10, 21).copy(month: 5).toString(), "2018/5/21");
  });
}
