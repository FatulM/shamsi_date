import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  test('Jalali.fromJulianDayNumber should work correctly', () {
    expect(Jalali.fromJulianDayNumber(2400000).julianDayNumber, 2400000);
    expect(Jalali.fromJulianDayNumber(2458605).julianDayNumber, 2458605);
    expect(Jalali.fromJulianDayNumber(2500000).julianDayNumber, 2500000);
  });

  test('Gregorian.fromJulianDayNumber should work correctly', () {
    expect(Gregorian.fromJulianDayNumber(2400000).julianDayNumber, 2400000);
    expect(Gregorian.fromJulianDayNumber(2458605).julianDayNumber, 2458605);
    expect(Gregorian.fromJulianDayNumber(2500000).julianDayNumber, 2500000);
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

  test('monthLength test should return month length of Jalali date', () {
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

  test('Jalali.now() should return today', () {
    final dt = DateTime.now();
    final g = Jalali.now().toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Jalali toDateTime method should work as expected', () {
    final j = Jalali(1398, 6, 6);
    final dt = j.toDateTime();
    final g = j.toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Gregorian.now() should return today', () {
    final dt = DateTime.now();
    final g = Gregorian.now();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Gregorian toDateTime method should work as expected', () {
    final g = Gregorian(2019, 8, 28);
    final dt = g.toDateTime();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Jalali hashCode should be as expected', () {
    final j1 = Jalali(1398, 6, 6);
    final j2 = Jalali(1398, 6, 6);
    expect(j2.hashCode, j1.hashCode);
    expect(j1.copy(year: 1397).hashCode != j1.hashCode, true);
    expect(j1.copy(month: 5).hashCode != j1.hashCode, true);
    expect(j1.copy(day: 7).hashCode != j1.hashCode, true);
  });

  test('Gregorian hashCode should be as expected', () {
    final g1 = Gregorian(2019, 8, 28);
    final g2 = Gregorian(2019, 8, 28);
    expect(g2.hashCode, g1.hashCode);
    expect(g1.copy(year: 2018).hashCode != g1.hashCode, true);
    expect(g1.copy(month: 7).hashCode != g1.hashCode, true);
    expect(g1.copy(day: 1).hashCode != g1.hashCode, true);
  });

  test('Jalali add operator test', () {
    expect(Jalali(1300, 2, 10) + 0, Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10) + 5, Jalali(1300, 2, 15));
    expect(Jalali(1300, 1, 31) + 36, Jalali(1300, 3, 5));
    expect(Jalali(1400, 1, 1) + 365, Jalali(1401, 1, 1));
  });

  test('Jalali subtract operator test', () {
    expect(Jalali(1300, 2, 10) - 0, Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 15) - 5, Jalali(1300, 2, 10));
    expect(Jalali(1300, 3, 5) - 36, Jalali(1300, 1, 31));
    expect(Jalali(1401, 1, 1) - 365, Jalali(1400, 1, 1));
  });

  test('Jalali add method operator test', () {
    expect(Jalali(1300, 2, 10).add(years: 10, months: 3, days: 8),
        Jalali(1310, 5, 18));
    expect(Jalali(1300, 5, 10).add(years: -10, months: -3, days: -8),
        Jalali(1290, 2, 2));
    expect(Jalali(1300, 2, 10).add(), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).add(years: 1), Jalali(1301, 2, 10));
    expect(Jalali(1300, 2, 10).add(months: 1), Jalali(1300, 3, 10));
    expect(Jalali(1300, 2, 10).add(days: 1), Jalali(1300, 2, 11));
  });

  test('isLeapYear should check if a Gregorian year is leap year', () {
    expect(Gregorian(1, 1, 1).isLeapYear(), false);
    expect(Gregorian(4, 1, 1).isLeapYear(), true);
    expect(Gregorian(40, 1, 1).isLeapYear(), true);
    expect(Gregorian(100, 1, 1).isLeapYear(), false);
    expect(Gregorian(200, 1, 1).isLeapYear(), false);
    expect(Gregorian(300, 1, 1).isLeapYear(), false);
    expect(Gregorian(204, 1, 1).isLeapYear(), true);
    expect(Gregorian(400, 1, 1).isLeapYear(), true);
  });

  test('monthLength test should return month length of Gregorian date', () {
    expect(Gregorian(1, 1, 1).monthLength, 31);
    expect(Gregorian(1, 2, 1).monthLength, 28);
    expect(Gregorian(2001, 2, 1).monthLength, 28);
    expect(Gregorian(4, 2, 1).monthLength, 29);
    expect(Gregorian(100, 2, 1).monthLength, 28);
    expect(Gregorian(1, 3, 1).monthLength, 31);
    expect(Gregorian(1, 4, 1).monthLength, 30);
    expect(Gregorian(1, 5, 1).monthLength, 31);
    expect(Gregorian(1, 6, 1).monthLength, 30);
    expect(Gregorian(1, 7, 1).monthLength, 31);
    expect(Gregorian(1, 8, 1).monthLength, 31);
    expect(Gregorian(1, 9, 1).monthLength, 30);
    expect(Gregorian(1, 10, 1).monthLength, 31);
    expect(Gregorian(1, 11, 1).monthLength, 30);
    expect(Gregorian(1, 12, 1).monthLength, 31);
  });

  test('isValid should check validity of a Gregorian date', () {
    expect(Gregorian(-100101, 1, 1).isValid(), false);
    expect(Gregorian(-100100, 1, 1).isValid(), true);
    expect(Gregorian(1000000, 1, 1).isValid(), true);
    expect(Gregorian(100000000, 1, 1).isValid(), false);
    expect(Gregorian(2000, 1, 1).isValid(), true);
    expect(Gregorian(2000, 0, 1).isValid(), false);
    expect(Gregorian(2000, -1, 1).isValid(), false);
    expect(Gregorian(2000, 13, 1).isValid(), false);
    expect(Gregorian(2000, 5, 1).isValid(), true);
    expect(Gregorian(2000, 1, 0).isValid(), false);
    expect(Gregorian(2000, 1, -1).isValid(), false);
    expect(Gregorian(2000, 1, 10).isValid(), true);
    expect(Gregorian(2000, 1, 32).isValid(), false);
    expect(Gregorian(2000, 12, 32).isValid(), false);
    expect(Gregorian(2000, 12, 31).isValid(), true);
    expect(Gregorian(2000, 1, 32).isValid(), false);
    expect(Gregorian(2004, 1, 29).isValid(), true);
    expect(Gregorian(1, 1, 1).isValid(), true);
    expect(Gregorian(2000, 2, 29).isValid(), true);
    expect(Gregorian(2000, 2, 30).isValid(), false);
    expect(Gregorian(2001, 2, 28).isValid(), true);
    expect(Gregorian(2001, 2, 29).isValid(), false);
    expect(Gregorian(2004, 2, 29).isValid(), true);
    expect(Gregorian(2004, 2, 30).isValid(), false);
  });
}
