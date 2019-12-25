import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  test('Jalali(year, month, day).{year, month, day}', () {
    final j = Jalali(1300, 1, 2);

    expect(j.year, 1300);
    expect(j.month, 1);
    expect(j.day, 2);

    expect(() {
      Jalali(null, 1, 2);
    }, throwsArgumentError);
    expect(() {
      Jalali(1300, null, 2);
    }, throwsArgumentError);
    expect(() {
      Jalali(1300, 1, null);
    }, throwsArgumentError);
  });

  test('Gregorian(year, month, day).{year, month, day}', () {
    final j = Gregorian(2000, 1, 2);

    expect(j.year, 2000);
    expect(j.month, 1);
    expect(j.day, 2);

    expect(() {
      Gregorian(null, 1, 2);
    }, throwsArgumentError);
    expect(() {
      Gregorian(2000, null, 2);
    }, throwsArgumentError);
    expect(() {
      Gregorian(2000, 1, null);
    }, throwsArgumentError);
  });

  test('Jalali.==', () {
    expect(Jalali(1000, 1, 1) == Jalali(1000, 1, 1), true);
    expect(Jalali(1000, 1, 1) != Jalali(1000, 1, 1), false);
    expect(Jalali(1001, 1, 1) == Jalali(1000, 1, 1), false);
    expect(Jalali(1000, 1, 1) == Jalali(1001, 1, 1), false);
    expect(Jalali(1000, 2, 1) == Jalali(1000, 1, 1), false);
    expect(Jalali(1000, 1, 1) == Jalali(1000, 2, 1), false);
    expect(Jalali(1000, 1, 2) == Jalali(1000, 1, 1), false);
    expect(Jalali(1000, 1, 1) == Jalali(1000, 1, 2), false);
  });

  test('Gregorian.==', () {
    expect(Gregorian(1000, 1, 1) == Gregorian(1000, 1, 1), true);
    expect(Gregorian(1000, 1, 1) != Gregorian(1000, 1, 1), false);
    expect(Gregorian(1001, 1, 1) == Gregorian(1000, 1, 1), false);
    expect(Gregorian(1000, 1, 1) == Gregorian(1001, 1, 1), false);
    expect(Gregorian(1000, 2, 1) == Gregorian(1000, 1, 1), false);
    expect(Gregorian(1000, 1, 1) == Gregorian(1000, 2, 1), false);
    expect(Gregorian(1000, 1, 2) == Gregorian(1000, 1, 1), false);
    expect(Gregorian(1000, 1, 1) == Gregorian(1000, 1, 2), false);
  });

  test('Jalali.toString', () {
    expect(Jalali(1398, 1, 10).toString(), 'Jalali(1398,1,10)');
    expect(Jalali(1398, 11, 1).toString(), 'Jalali(1398,11,1)');
    expect(Jalali(500, 1, 1).toString(), 'Jalali(500,1,1)');
  });

  test('Gregorian.toString', () {
    expect(Gregorian(2000, 1, 10).toString(), 'Gregorian(2000,1,10)');
    expect(Gregorian(2000, 11, 1).toString(), 'Gregorian(2000,11,1)');
    expect(Gregorian(500, 1, 1).toString(), 'Gregorian(500,1,1)');
    expect(Gregorian(0, 1, 1).toString(), 'Gregorian(0,1,1)');
  });

  test('Jalali.{ fromJulianDayNumber , julianDayNumber }', () {
    expect(Jalali.fromJulianDayNumber(2400000).julianDayNumber, 2400000);
    expect(Jalali.fromJulianDayNumber(2458605).julianDayNumber, 2458605);
    expect(Jalali.fromJulianDayNumber(2500000).julianDayNumber, 2500000);

    expect(() {
      Jalali.fromJulianDayNumber(null);
    }, throwsArgumentError);
  });

  test('Gregorian.{ fromJulianDayNumber , julianDayNumber }', () {
    expect(Gregorian.fromJulianDayNumber(2400000).julianDayNumber, 2400000);
    expect(Gregorian.fromJulianDayNumber(2458605).julianDayNumber, 2458605);
    expect(Gregorian.fromJulianDayNumber(2500000).julianDayNumber, 2500000);

    expect(() {
      Gregorian.fromJulianDayNumber(null);
    }, throwsArgumentError);
  });

  test('Jalali.fromJulianDayNumber', () {
    expect(Jalali.fromJulianDayNumber(2458819), Jalali(1398, 9, 10));
    // todo not complete
  });

  test('Gregorian.fromJulianDayNumber', () {
    expect(Gregorian.fromJulianDayNumber(2458819), Gregorian(2019, 12, 1));
    // todo not complete
  });

  test('Jalali.julianDayNumber', () {
    expect(Jalali(1398, 9, 10).julianDayNumber, 2458819);
    // todo not complete
  });

  test('Gregorian.julianDayNumber', () {
    expect(Gregorian(2019, 12, 1).julianDayNumber, 2458819);
    // todo not complete
  });

  test('Jalali.toGregorian', () {
    expect(Jalali(1360, 5, 26).toGregorian(), Gregorian(1981, 8, 17));
    expect(Jalali(1391, 10, 21).toGregorian(), Gregorian(2013, 1, 10));
    expect(Jalali(1393, 5, 13).toGregorian(), Gregorian(2014, 8, 4));
  });

  test('Gregorian.toJalali', () {
    expect(Gregorian(1981, 8, 17).toJalali(), Jalali(1360, 5, 26));
    expect(Gregorian(2013, 1, 10).toJalali(), Jalali(1391, 10, 21));
    expect(Gregorian(2014, 8, 4).toJalali(), Jalali(1393, 5, 13));
  });

  test('Jalali.fromGregorian', () {
    expect(Jalali.fromGregorian(Gregorian(1981, 8, 17)), Jalali(1360, 5, 26));
  });

  test('Gregorian.fromJalali', () {
    expect(Gregorian.fromJalali(Jalali(1360, 5, 26)), Gregorian(1981, 8, 17));
  });

  test('Jalali.isValid', () {
    expect(Jalali(-62, 12, 29).isValid(), false);
    expect(Jalali(-62, 12, 29).isValid(), false);
    expect(Jalali(-61, 1, 1).isValid(), true);
    expect(Jalali(3178, 1, 1).isValid(), false);
    expect(Jalali(3177, 12, 29).isValid(), true);
    expect(Jalali(1393, 0, 1).isValid(), false);
    expect(Jalali(1393, -1, 1).isValid(), false);
    expect(Jalali(1393, 13, 1).isValid(), false);
    expect(Jalali(1393, 1, 0).isValid(), false);
    expect(Jalali(1393, 1, -1).isValid(), false);
    expect(Jalali(1393, 1, 32).isValid(), false);
    expect(Jalali(1393, 1, 31).isValid(), true);
    expect(Jalali(1393, 11, 31).isValid(), false);
    expect(Jalali(1393, 11, 30).isValid(), true);
    expect(Jalali(1393, 12, 30).isValid(), false);
    expect(Jalali(1393, 12, 29).isValid(), true);
    expect(Jalali(1395, 12, 30).isValid(), true);
  });

  test('Gregorian.isValid', () {
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

  test('Jalali.isLeapYear', () {
    expect(Jalali(1393).isLeapYear(), false);
    expect(Jalali(1394).isLeapYear(), false);
    expect(Jalali(1395).isLeapYear(), true);
    expect(Jalali(1396).isLeapYear(), false);
  });

  test('Gregorian.isLeapYear', () {
    expect(Gregorian(1, 1, 1).isLeapYear(), false);
    expect(Gregorian(4, 1, 1).isLeapYear(), true);
    expect(Gregorian(40, 1, 1).isLeapYear(), true);
    expect(Gregorian(100, 1, 1).isLeapYear(), false);
    expect(Gregorian(200, 1, 1).isLeapYear(), false);
    expect(Gregorian(300, 1, 1).isLeapYear(), false);
    expect(Gregorian(204, 1, 1).isLeapYear(), true);
    expect(Gregorian(400, 1, 1).isLeapYear(), true);
  });

  test('Jalali.monthLength', () {
    expect(Jalali(1393, 1).monthLength, 31);
    expect(Jalali(1393, 4).monthLength, 31);
    expect(Jalali(1393, 6).monthLength, 31);
    expect(Jalali(1393, 7).monthLength, 30);
    expect(Jalali(1393, 10).monthLength, 30);
    expect(Jalali(1393, 12).monthLength, 29);
    expect(Jalali(1394, 12).monthLength, 29);
    expect(Jalali(1395, 12).monthLength, 30);
  });

  test('Gregorian.monthLength', () {
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

  test('Jalali.weekDay', () {
    expect(Jalali(1397, 10, 24).weekDay, 3);
    expect(Jalali(1397, 10, 11).weekDay, 4);
    expect(Jalali(1305, 1, 5).weekDay, 7);
    expect(Jalali(1305, 1, 6).weekDay, 1);
  });

  test('Gregorian.weekDay', () {
    expect(Gregorian(1969, 7, 20).weekDay, 7);
    expect(Gregorian(2019, 1, 14).weekDay, 1);
    expect(Gregorian(2019, 1, 10).weekDay, 4);
  });

  test('Jalali.{ compareTo , > , >= , == ,  <= , < }', () {
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

  test('Gregorian.{ compareTo , > , >= , == ,  <= , < }', () {
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

  test('JalaliFormatter(date)', () {
    expect(() {
      JalaliFormatter(null);
    }, throwsArgumentError);
  });

  test('GregorianFormatter(date)', () {
    expect(() {
      GregorianFormatter(null);
    }, throwsArgumentError);
  });

  test('JalaliFormatter.yyyy', () {
    expect(Jalali(0).formatter.yyyy, '0000');
    expect(Jalali(1).formatter.yyyy, '0001');
    expect(Jalali(12).formatter.yyyy, '0012');
    expect(Jalali(123).formatter.yyyy, '0123');
    expect(Jalali(1234).formatter.yyyy, '1234');
    expect(Jalali(9999).formatter.yyyy, '9999');
    expect(() {
      Jalali(-1).formatter.yyyy;
    }, throwsStateError);
    expect(() {
      Jalali(10000).formatter.yyyy;
    }, throwsStateError);
  });

  test('GregorianFormatter.yyyy', () {
    expect(Gregorian(0).formatter.yyyy, '0000');
    expect(Gregorian(1).formatter.yyyy, '0001');
    expect(Gregorian(12).formatter.yyyy, '0012');
    expect(Gregorian(123).formatter.yyyy, '0123');
    expect(Gregorian(1234).formatter.yyyy, '1234');
    expect(Gregorian(9999).formatter.yyyy, '9999');
    expect(() {
      Gregorian(-1).formatter.yyyy;
    }, throwsStateError);
    expect(() {
      Gregorian(10000).formatter.yyyy;
    }, throwsStateError);
  });

  test('Jalali.formatter', () {
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

  test('Gregorian.formatter', () {
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

  test('Jalali.copy', () {
    expect(Jalali(1395, 10, 21).copy(), Jalali(1395, 10, 21));
    expect(Jalali(1395, 10, 21).copy(year: 1390), Jalali(1390, 10, 21));
    expect(Jalali(1395, 10, 21).copy(month: 5), Jalali(1395, 5, 21));
    expect(Jalali(1395, 10, 21).copy(day: 10), Jalali(1395, 10, 10));
    expect(Jalali(1395, 10, 21).copy(year: 1390, month: 5, day: 10),
        Jalali(1390, 5, 10));
  });

  test('Gregorian.copy', () {
    expect(Gregorian(2010, 10, 21).copy(), Gregorian(2010, 10, 21));
    expect(Gregorian(2010, 10, 21).copy(year: 2000), Gregorian(2000, 10, 21));
    expect(Gregorian(2010, 10, 21).copy(month: 5), Gregorian(2010, 5, 21));
    expect(Gregorian(2010, 10, 21).copy(day: 10), Gregorian(2010, 10, 10));
    expect(Gregorian(2010, 10, 21).copy(year: 2000, month: 5, day: 10),
        Gregorian(2000, 5, 10));
  });

  test('Jalali.now', () {
    final dt = DateTime.now();
    final g = Jalali.now().toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Gregorian.now', () {
    final dt = DateTime.now();
    final g = Gregorian.now();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Jalali.toDateTime', () {
    final j = Jalali(1398, 6, 6);
    final dt = j.toDateTime();
    final g = j.toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Gregorian.toDateTime', () {
    final g = Gregorian(2019, 8, 28);
    final dt = g.toDateTime();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
  });

  test('Jalali.hashCode', () {
    final j1 = Jalali(1398, 6, 6);
    final j2 = Jalali(1398, 6, 6);
    expect(j2.hashCode, j1.hashCode);
    expect(j1.copy(year: 1397).hashCode != j1.hashCode, true);
    expect(j1.copy(month: 5).hashCode != j1.hashCode, true);
    expect(j1.copy(day: 7).hashCode != j1.hashCode, true);
  });

  test('Gregorian.hashCode', () {
    final g1 = Gregorian(2019, 8, 28);
    final g2 = Gregorian(2019, 8, 28);
    expect(g2.hashCode, g1.hashCode);
    expect(g1.copy(year: 2018).hashCode != g1.hashCode, true);
    expect(g1.copy(month: 7).hashCode != g1.hashCode, true);
    expect(g1.copy(day: 1).hashCode != g1.hashCode, true);
  });

  test('Jalali.+', () {
    expect(Jalali(1300, 2, 10) + 0, Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10) + 5, Jalali(1300, 2, 15));
    expect(Jalali(1300, 2, 10) + (-10), Jalali(1300, 1, 31));
    expect(Jalali(1300, 1, 31) + 36, Jalali(1300, 3, 5));
    expect(Jalali(1400, 1, 1) + 365, Jalali(1401, 1, 1));
  });

  test('Gregorian.+', () {
    expect(Gregorian(2000, 2, 10) + 0, Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10) + 5, Gregorian(2000, 2, 15));
    expect(Gregorian(2000, 2, 10) + (-10), Gregorian(2000, 1, 31));
    expect(Gregorian(2000, 1, 31) + 34, Gregorian(2000, 3, 5));
    expect(Gregorian(2000, 1, 1) + 366, Gregorian(2001, 1, 1));
  });

  test('Jalali.-', () {
    expect(Jalali(1300, 2, 10) - 0, Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10) - (-22), Jalali(1300, 3, 1));
    expect(Jalali(1300, 2, 15) - 5, Jalali(1300, 2, 10));
    expect(Jalali(1300, 3, 5) - 36, Jalali(1300, 1, 31));
    expect(Jalali(1401, 1, 1) - 365, Jalali(1400, 1, 1));
  });

  test('Gregorian.-', () {
    expect(Gregorian(2000, 2, 10) - 0, Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 15) - 5, Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 1, 31) - (-10), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 3, 5) - 34, Gregorian(2000, 1, 31));
    expect(Gregorian(2001, 1, 1) - 366, Gregorian(2000, 1, 1));
  });

  test('Jalali.add', () {
    expect(Jalali(1300, 2, 10).add(), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).add(years: 1), Jalali(1301, 2, 10));
    expect(Jalali(1300, 2, 10).add(months: 1), Jalali(1300, 3, 10));
    expect(Jalali(1300, 2, 10).add(days: 1), Jalali(1300, 2, 11));
    expect(Jalali(1300, 2, 10).add(years: 10, months: 3, days: 8),
        Jalali(1310, 5, 18));
    expect(Jalali(1300, 5, 10).add(years: -10, months: -3, days: -8),
        Jalali(1290, 2, 2));
  });

  test('Gregorian.add', () {
    expect(Gregorian(2000, 2, 10).add(), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10).add(years: 1), Gregorian(2001, 2, 10));
    expect(Gregorian(2000, 2, 10).add(months: 1), Gregorian(2000, 3, 10));
    expect(Gregorian(2000, 2, 10).add(days: 1), Gregorian(2000, 2, 11));
    expect(Gregorian(2000, 2, 10).add(years: 10, months: 3, days: 8),
        Gregorian(2010, 5, 18));
    expect(Gregorian(2000, 5, 10).add(years: -10, months: -3, days: -8),
        Gregorian(1990, 2, 2));
  });

  test('Jalali.addYears', () {
    expect(Jalali(1300, 2, 10).addYears(0), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).addYears(10), Jalali(1310, 2, 10));
    expect(Jalali(1300, 2, 10).addYears(-10), Jalali(1290, 2, 10));

    expect(() {
      Jalali(1300, 2, 10).addYears(null);
    }, throwsArgumentError);
  });

  test('Gregorian.addYears', () {
    expect(Gregorian(1300, 2, 10).addYears(0), Gregorian(1300, 2, 10));
    expect(Gregorian(1300, 2, 10).addYears(10), Gregorian(1310, 2, 10));
    expect(Gregorian(1300, 2, 10).addYears(-10), Gregorian(1290, 2, 10));

    expect(() {
      Gregorian(1300, 2, 10).addYears(null);
    }, throwsArgumentError);
  });

  test('Jalali.addMonths', () {
    expect(Jalali(1300, 2, 10).addMonths(0), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).addMonths(1), Jalali(1300, 3, 10));
    expect(Jalali(1300, 2, 10).addMonths(12), Jalali(1301, 2, 10));
    expect(Jalali(1300, 2, 10).addMonths(14), Jalali(1301, 4, 10));
    expect(Jalali(1300, 2, 10).addMonths(10), Jalali(1300, 12, 10));
    expect(Jalali(1300, 2, 10).addMonths(-1), Jalali(1300, 1, 10));
    expect(Jalali(1300, 2, 10).addMonths(-2), Jalali(1299, 12, 10));
    expect(Jalali(1300, 2, 10).addMonths(-25), Jalali(1298, 1, 10));

    expect(() {
      Jalali(1300, 2, 10).addMonths(null);
    }, throwsArgumentError);
  });

  test('Gregorian.addMonths', () {
    expect(Gregorian(1300, 2, 10).addMonths(0), Gregorian(1300, 2, 10));
    expect(Gregorian(1300, 2, 10).addMonths(1), Gregorian(1300, 3, 10));
    expect(Gregorian(1300, 2, 10).addMonths(12), Gregorian(1301, 2, 10));
    expect(Gregorian(1300, 2, 10).addMonths(14), Gregorian(1301, 4, 10));
    expect(Gregorian(1300, 2, 10).addMonths(10), Gregorian(1300, 12, 10));
    expect(Gregorian(1300, 2, 10).addMonths(-1), Gregorian(1300, 1, 10));
    expect(Gregorian(1300, 2, 10).addMonths(-2), Gregorian(1299, 12, 10));
    expect(Gregorian(1300, 2, 10).addMonths(-25), Gregorian(1298, 1, 10));

    expect(() {
      Gregorian(1300, 2, 10).addMonths(null);
    }, throwsArgumentError);
  });

  test('Jalali.addDays', () {
    expect(Jalali(1300, 2, 10).addDays(0), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).addDays(5), Jalali(1300, 2, 15));
    expect(Jalali(1300, 2, 10).addDays(-10), Jalali(1300, 1, 31));
    expect(Jalali(1300, 1, 31).addDays(36), Jalali(1300, 3, 5));
    expect(Jalali(1400, 1, 1).addDays(365), Jalali(1401, 1, 1));

    expect(() {
      Jalali(1300, 2, 10).addDays(null);
    }, throwsArgumentError);
  });

  test('Gregorian.addDays', () {
    expect(Gregorian(2000, 2, 10).addDays(0), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10).addDays(5), Gregorian(2000, 2, 15));
    expect(Gregorian(2000, 2, 10).addDays(-10), Gregorian(2000, 1, 31));
    expect(Gregorian(2000, 1, 31).addDays(34), Gregorian(2000, 3, 5));
    expect(Gregorian(2000, 1, 1).addDays(366), Gregorian(2001, 1, 1));

    expect(() {
      Gregorian(1300, 2, 10).addDays(null);
    }, throwsArgumentError);
  });

  test('Jalali.withYear', () {
    expect(Jalali(1398, 10, 20).withYear(1398), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withYear(1300), Jalali(1300, 10, 20));
    expect(Jalali(1398, 10, 20).withYear(1400), Jalali(1400, 10, 20));

    expect(() {
      Jalali(1398, 10, 20).withYear(null);
    }, throwsArgumentError);
  });

  test('Gregorian.withYear', () {
    expect(Gregorian(2020, 10, 20).withYear(2020), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withYear(2010), Gregorian(2010, 10, 20));
    expect(Gregorian(2030, 10, 20).withYear(2030), Gregorian(2030, 10, 20));

    expect(() {
      Gregorian(2020, 10, 20).withYear(null);
    }, throwsArgumentError);
  });

  test('Jalali.withMonth', () {
    expect(Jalali(1398, 10, 20).withMonth(10), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withMonth(1), Jalali(1398, 1, 20));
    expect(Jalali(1398, 10, 20).withMonth(12), Jalali(1398, 12, 20));

    expect(() {
      Jalali(1398, 10, 20).withMonth(null);
    }, throwsArgumentError);
  });

  test('Gregorian.withMonth', () {
    expect(Gregorian(2020, 10, 20).withMonth(10), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withMonth(1), Gregorian(2020, 1, 20));
    expect(Gregorian(2020, 10, 20).withMonth(12), Gregorian(2020, 12, 20));

    expect(() {
      Gregorian(2020, 10, 20).withMonth(null);
    }, throwsArgumentError);
  });

  test('Jalali.withDay', () {
    expect(Jalali(1398, 10, 20).withDay(20), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withDay(15), Jalali(1398, 10, 15));
    expect(Jalali(1398, 10, 20).withDay(25), Jalali(1398, 10, 25));

    expect(() {
      Jalali(1398, 10, 20).withDay(null);
    }, throwsArgumentError);
  });

  test('Gregorian.withDay', () {
    expect(Gregorian(2020, 10, 20).withDay(20), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withDay(15), Gregorian(2020, 10, 15));
    expect(Gregorian(2020, 10, 20).withDay(25), Gregorian(2020, 10, 25));

    expect(() {
      Gregorian(2020, 10, 20).withDay(null);
    }, throwsArgumentError);
  });
}
