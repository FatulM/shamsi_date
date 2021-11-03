// Copyright 2018 - 2021, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:shamsi_date/extensions.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:test/test.dart';

Matcher get tde => throwsA(isA<DateException>());

void main() {
  test('Jalali(year, month, day).{year, month, day}', () {
    final j1 = Jalali(1300);

    expect(j1.year, 1300);
    expect(j1.month, 1);
    expect(j1.day, 1);
    expect(j1.hour, 0);
    expect(j1.minute, 0);
    expect(j1.second, 0);
    expect(j1.millisecond, 0);

    final j2 = Jalali(1300, 2, 3, 4, 5, 6, 7);

    expect(j2.year, 1300);
    expect(j2.month, 2);
    expect(j2.day, 3);
    expect(j2.hour, 4);
    expect(j2.minute, 5);
    expect(j2.second, 6);
    expect(j2.millisecond, 7);
  });

  test('Gregorian(year, month, day).{year, month, day}', () {
    final j1 = Gregorian(2000);

    expect(j1.year, 2000);
    expect(j1.month, 1);
    expect(j1.day, 1);
    expect(j1.hour, 0);
    expect(j1.minute, 0);
    expect(j1.second, 0);
    expect(j1.millisecond, 0);

    final j2 = Gregorian(2000, 2, 3, 4, 5, 6, 7);

    expect(j2.year, 2000);
    expect(j2.month, 2);
    expect(j2.day, 3);
    expect(j2.hour, 4);
    expect(j2.minute, 5);
    expect(j2.second, 6);
    expect(j2.millisecond, 7);
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

    expect(
      Jalali(1000, 1, 2, 3, 4, 5, 6) == Jalali(1000, 1, 2, 3, 4, 5, 6),
      true,
    );
    expect(
      Jalali(1000, 1, 2, 3, 4, 5, 6) == Jalali(1000, 1, 2, 9, 4, 5, 6),
      false,
    );
    expect(
      Jalali(1000, 1, 2, 3, 4, 5, 6) == Jalali(1000, 1, 2, 3, 9, 5, 6),
      false,
    );
    expect(
      Jalali(1000, 1, 2, 3, 4, 5, 6) == Jalali(1000, 1, 2, 3, 4, 9, 6),
      false,
    );
    expect(
      Jalali(1000, 1, 2, 3, 4, 5, 6) == Jalali(1000, 1, 2, 3, 4, 5, 9),
      false,
    );
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

    expect(
      Gregorian(1000, 1, 2, 3, 4, 5, 6) == Gregorian(1000, 1, 2, 3, 4, 5, 6),
      true,
    );
    expect(
      Gregorian(1000, 1, 2, 3, 4, 5, 6) == Gregorian(1000, 1, 2, 9, 4, 5, 6),
      false,
    );
    expect(
      Gregorian(1000, 1, 2, 3, 4, 5, 6) == Gregorian(1000, 1, 2, 3, 9, 5, 6),
      false,
    );
    expect(
      Gregorian(1000, 1, 2, 3, 4, 5, 6) == Gregorian(1000, 1, 2, 3, 4, 9, 6),
      false,
    );
    expect(
      Gregorian(1000, 1, 2, 3, 4, 5, 6) == Gregorian(1000, 1, 2, 3, 4, 5, 9),
      false,
    );
  });

  test('Date.==', () {
    expect(Jalali(1400, 2, 30) == Gregorian(2021, 5, 20), true);
    expect(Jalali(1400, 2, 30) == Gregorian(2021, 5, 5), false);
    expect(Gregorian(2021, 5, 20) == Jalali(1400, 2, 30), true);
    expect(Gregorian(2021, 5, 20) == Jalali(1400, 2, 5), false);

    expect(
      Jalali(1400, 2, 30, 1, 2, 3, 4) == Gregorian(2021, 5, 20, 1, 2, 3, 4),
      true,
    );
    expect(
      Jalali(1400, 2, 30, 1, 2, 3, 4) == Gregorian(2021, 5, 20, 1, 2, 5, 4),
      false,
    );
    expect(
      Gregorian(2021, 5, 20, 1, 2, 3, 4) == Jalali(1400, 2, 30, 1, 2, 3, 4),
      true,
    );
    expect(
      Gregorian(2021, 5, 20, 1, 2, 3, 4) == Jalali(1400, 2, 30, 1, 2, 5, 4),
      false,
    );
  });

  test('Jalali.toString', () {
    expect(
      Jalali(1398, 1, 10).toString(),
      'Jalali(1398, 1, 10, 0, 0, 0, 0)',
    );
    expect(
      Jalali(1398, 11, 1).toString(),
      'Jalali(1398, 11, 1, 0, 0, 0, 0)',
    );
    expect(
      Jalali(500, 1, 1).toString(),
      'Jalali(500, 1, 1, 0, 0, 0, 0)',
    );

    expect(
      Jalali(1000, 1, 2, 3, 4, 5, 6).toString(),
      'Jalali(1000, 1, 2, 3, 4, 5, 6)',
    );
  });

  test('Gregorian.toString', () {
    expect(
      Gregorian(2000, 1, 10).toString(),
      'Gregorian(2000, 1, 10, 0, 0, 0, 0)',
    );
    expect(
      Gregorian(2000, 11, 1).toString(),
      'Gregorian(2000, 11, 1, 0, 0, 0, 0)',
    );
    expect(
      Gregorian(600, 1, 1).toString(),
      'Gregorian(600, 1, 1, 0, 0, 0, 0)',
    );

    expect(
      Gregorian(1000, 1, 2, 3, 4, 5, 6).toString(),
      'Gregorian(1000, 1, 2, 3, 4, 5, 6)',
    );
  });

  test('Jalali.{ fromJulianDayNumber , julianDayNumber }', () {
    expect(Jalali.fromJulianDayNumber(1925675).julianDayNumber, 1925675);
    expect(Jalali.fromJulianDayNumber(2400000).julianDayNumber, 2400000);
    expect(Jalali.fromJulianDayNumber(2458605).julianDayNumber, 2458605);
    expect(Jalali.fromJulianDayNumber(2500000).julianDayNumber, 2500000);
    expect(Jalali.fromJulianDayNumber(3108616).julianDayNumber, 3108616);

    expect(() => Jalali.fromJulianDayNumber(1925674), tde);
    expect(() => Jalali.fromJulianDayNumber(3108617), tde);

    Jalali.fromJulianDayNumber(3108616, 23, 59, 59, 999);

    expect(() => Jalali.fromJulianDayNumber(2400000, -1, 0, 0, 0), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 24, 0, 0, 0), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 0, -1, 0, 0), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 0, 60, 0, 0), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 0, 0, -1, 0), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 0, 0, 60, 0), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 0, 0, 0, -1), tde);
    expect(() => Jalali.fromJulianDayNumber(2400000, 0, 0, 0, 1000), tde);

    final d = Jalali.fromJulianDayNumber(2400000, 1, 2, 3, 4);
    expect(d.julianDayNumber, 2400000);
    expect(d.hour, 1);
    expect(d.minute, 2);
    expect(d.second, 3);
    expect(d.millisecond, 4);
  });

  test('Gregorian.{ fromJulianDayNumber , julianDayNumber }', () {
    expect(Gregorian.fromJulianDayNumber(1925675).julianDayNumber, 1925675);
    expect(Gregorian.fromJulianDayNumber(2400000).julianDayNumber, 2400000);
    expect(Gregorian.fromJulianDayNumber(2458605).julianDayNumber, 2458605);
    expect(Gregorian.fromJulianDayNumber(2500000).julianDayNumber, 2500000);
    expect(Gregorian.fromJulianDayNumber(3108616).julianDayNumber, 3108616);

    expect(() => Gregorian.fromJulianDayNumber(1925674), tde);
    expect(() => Gregorian.fromJulianDayNumber(3108617), tde);

    Gregorian.fromJulianDayNumber(3108616, 23, 59, 59, 999);

    expect(() => Gregorian.fromJulianDayNumber(2400000, -1, 0, 0, 0), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 24, 0, 0, 0), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 0, -1, 0, 0), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 0, 60, 0, 0), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 0, 0, -1, 0), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 0, 0, 60, 0), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 0, 0, 0, -1), tde);
    expect(() => Gregorian.fromJulianDayNumber(2400000, 0, 0, 0, 1000), tde);

    final d = Gregorian.fromJulianDayNumber(2400000, 1, 2, 3, 4);
    expect(d.julianDayNumber, 2400000);
    expect(d.hour, 1);
    expect(d.minute, 2);
    expect(d.second, 3);
    expect(d.millisecond, 4);
  });

  test('Jalali.fromJulianDayNumber', () {
    expect(Jalali.fromJulianDayNumber(3108616), Jalali(3177, 10, 11));
    expect(Jalali.fromJulianDayNumber(2458819), Jalali(1398, 9, 10));
    expect(Jalali.fromJulianDayNumber(2305310), Jalali(978, 5, 25));
    expect(Jalali.fromJulianDayNumber(1953463), Jalali(15, 1, 30));
    expect(Jalali.fromJulianDayNumber(1942832), Jalali(-15, 12, 20));
    expect(Jalali.fromJulianDayNumber(1925675), Jalali(-61, 1, 1));

    expect(
      Jalali.fromJulianDayNumber(2458819, 1, 2, 3, 4),
      Jalali(1398, 9, 10, 1, 2, 3, 4),
    );
  });

  test('Gregorian.fromJulianDayNumber', () {
    expect(Gregorian.fromJulianDayNumber(1925675), Gregorian(560, 3, 20));
    expect(Gregorian.fromJulianDayNumber(2458819), Gregorian(2019, 12, 1));
    expect(Gregorian.fromJulianDayNumber(2305310), Gregorian(1599, 8, 16));
    expect(Gregorian.fromJulianDayNumber(1953463), Gregorian(636, 4, 19));
    expect(Gregorian.fromJulianDayNumber(1942832), Gregorian(607, 3, 12));
    expect(Gregorian.fromJulianDayNumber(3108616), Gregorian(3798, 12, 31));

    expect(
      Gregorian.fromJulianDayNumber(2458820, 1, 2, 3, 4),
      Gregorian(2019, 12, 2, 1, 2, 3, 4),
    );
  });

  test('Jalali.julianDayNumber', () {
    expect(Jalali(3177, 10, 11).julianDayNumber, 3108616);
    expect(Jalali(1398, 9, 10).julianDayNumber, 2458819);
    expect(Jalali(978, 5, 25).julianDayNumber, 2305310);
    expect(Jalali(15, 1, 30).julianDayNumber, 1953463);
    expect(Jalali(-15, 12, 20).julianDayNumber, 1942832);
    expect(Jalali(-61, 1, 1).julianDayNumber, 1925675);

    expect(Jalali(1398, 9, 10, 1, 2, 3, 4).julianDayNumber, 2458819);
  });

  test('Gregorian.julianDayNumber', () {
    expect(Gregorian(560, 3, 20).julianDayNumber, 1925675);
    expect(Gregorian(2019, 12, 1).julianDayNumber, 2458819);
    expect(Gregorian(1599, 8, 16).julianDayNumber, 2305310);
    expect(Gregorian(636, 4, 19).julianDayNumber, 1953463);
    expect(Gregorian(607, 3, 12).julianDayNumber, 1942832);
    expect(Gregorian(3798, 12, 31).julianDayNumber, 3108616);

    expect(Gregorian(2019, 12, 2, 1, 2, 3, 4).julianDayNumber, 2458820);
  });

  test('Jalali.toGregorian', () {
    expect(Jalali(1360, 5, 26).toGregorian(), Gregorian(1981, 8, 17));
    expect(Jalali(1391, 10, 21).toGregorian(), Gregorian(2013, 1, 10));
    expect(Jalali(1393, 5, 13).toGregorian(), Gregorian(2014, 8, 4));

    expect(
      Jalali(1360, 5, 26, 1, 2, 3, 4).toGregorian(),
      Gregorian(1981, 8, 17, 1, 2, 3, 4),
    );
  });

  test('Gregorian.toJalali', () {
    expect(Gregorian(1981, 8, 17).toJalali(), Jalali(1360, 5, 26));
    expect(Gregorian(2013, 1, 10).toJalali(), Jalali(1391, 10, 21));
    expect(Gregorian(2014, 8, 4).toJalali(), Jalali(1393, 5, 13));

    expect(
      Gregorian(2013, 1, 10, 1, 2, 3, 4).toJalali(),
      Jalali(1391, 10, 21, 1, 2, 3, 4),
    );
  });

  test('Jalali.fromGregorian', () {
    expect(Jalali.fromGregorian(Gregorian(1981, 8, 17)), Jalali(1360, 5, 26));

    expect(
      Jalali.fromGregorian(Gregorian(1981, 8, 17, 1, 2, 3, 4)),
      Jalali(1360, 5, 26, 1, 2, 3, 4),
    );
  });

  test('Gregorian.fromJalali', () {
    expect(Gregorian.fromJalali(Jalali(1360, 5, 26)), Gregorian(1981, 8, 17));

    expect(
      Gregorian.fromJalali(Jalali(1360, 5, 26, 1, 2, 3, 4)),
      Gregorian(1981, 8, 17, 1, 2, 3, 4),
    );
  });

  test('Jalali(year, month, day) validation', () {
    expect(() => Jalali(-62, 12, 29), tde);
    Jalali(-61, 1, 1);
    Jalali(-61, 1, 10);
    Jalali(-61, 10, 1);
    expect(() => Jalali(3178, 1, 1), tde);
    expect(() => Jalali(3177, 10, 12), tde);
    expect(() => Jalali(3177, 11, 1), tde);
    expect(() => Jalali(3177, 11, 20), tde);
    Jalali(3177, 10, 11);
    expect(() => Jalali(1393, 0, 1), tde);
    expect(() => Jalali(1393, -1, 1), tde);
    expect(() => Jalali(1393, 13, 1), tde);
    expect(() => Jalali(1393, 1, 0), tde);
    expect(() => Jalali(1393, 1, -1), tde);
    expect(() => Jalali(1393, 1, 32), tde);
    Jalali(1393, 1, 31);
    expect(() => Jalali(1393, 11, 31), tde);
    Jalali(1393, 11, 30);
    expect(() => Jalali(1393, 12, 30), tde);
    Jalali(1393, 12, 29);
    Jalali(1395, 12, 30);

    // check corner cases an issue fixed due to performance problems:
    // 1399 is leap
    Jalali(1399, 11, 1);
    Jalali(1399, 11, 29);
    Jalali(1399, 11, 30);
    expect(() => Jalali(1399, 11, -1), tde);
    expect(() => Jalali(1399, 11, 0), tde);
    expect(() => Jalali(1399, 11, 31), tde);
    Jalali(1399, 12, 1);
    Jalali(1399, 12, 10);
    Jalali(1399, 12, 29);
    Jalali(1399, 12, 30);
    expect(() => Jalali(1399, 12, -1), tde);
    expect(() => Jalali(1399, 12, 0), tde);
    expect(() => Jalali(1399, 12, 31), tde);
    // 1398 is not leap
    Jalali(1398, 11, 1);
    Jalali(1398, 11, 29);
    Jalali(1398, 11, 30);
    expect(() => Jalali(1398, 11, -1), tde);
    expect(() => Jalali(1398, 11, 0), tde);
    expect(() => Jalali(1398, 11, 31), tde);
    Jalali(1398, 12, 1);
    Jalali(1398, 12, 10);
    Jalali(1398, 12, 29);
    expect(() => Jalali(1398, 12, -1), tde);
    expect(() => Jalali(1398, 12, 0), tde);
    expect(() => Jalali(1398, 12, 30), tde);
    expect(() => Jalali(1398, 12, 31), tde);

    expect(() => Jalali(1300, 1, 1, -1, 0, 0, 0), tde);
    expect(() => Jalali(1300, 1, 1, 24, 0, 0, 0), tde);
    expect(() => Jalali(1300, 1, 1, 0, -1, 0, 0), tde);
    expect(() => Jalali(1300, 1, 1, 0, 60, 0, 0), tde);
    expect(() => Jalali(1300, 1, 1, 0, 0, -1, 0), tde);
    expect(() => Jalali(1300, 1, 1, 0, 0, 60, 0), tde);
    expect(() => Jalali(1300, 1, 1, 0, 0, 0, -1), tde);
    expect(() => Jalali(1300, 1, 1, 0, 0, 0, 1000), tde);

    expect(() => Jalali(1300, -1, 1, 0, 0, 0, 0), tde);
    expect(() => Jalali(1300, -1, 1, 0, -1, 0, 0), tde);
    expect(() => Jalali(1300, -1, 1, 0, 0, 0, 1000), tde);
  });

  test('Gregorian(year, month, day) validation', () {
    expect(() => Gregorian(560, 3, 19), tde);
    expect(() => Gregorian(560, 2, 22), tde);
    expect(() => Gregorian(560, 1, 10), tde);
    expect(() => Gregorian(559, 12, 31), tde);
    Gregorian(560, 3, 20);
    Gregorian(3798, 10, 20);
    Gregorian(3798, 12, 31);
    expect(() => Gregorian(3799, 1, 1), tde);
    Gregorian(2000, 1, 1);
    expect(() => Gregorian(2000, 0, 1), tde);
    expect(() => Gregorian(2000, -1, 1), tde);
    expect(() => Gregorian(2000, 13, 1), tde);
    Gregorian(2000, 5, 1);
    expect(() => Gregorian(2000, 1, 0), tde);
    expect(() => Gregorian(2000, 1, -1), tde);
    Gregorian(2000, 1, 10);
    expect(() => Gregorian(2000, 1, 32), tde);
    expect(() => Gregorian(2000, 12, 32), tde);
    Gregorian(2000, 12, 31);
    expect(() => Gregorian(2000, 1, 32), tde);
    Gregorian(2004, 1, 29);
    Gregorian(600, 1, 1);
    Gregorian(2000, 2, 29);
    expect(() => Gregorian(2000, 2, 30), tde);
    Gregorian(2001, 2, 28);
    expect(() => Gregorian(2001, 2, 29), tde);
    Gregorian(2004, 2, 29);
    expect(() => Gregorian(2004, 2, 30), tde);

    expect(() => Gregorian(2000, 1, 1, -1, 0, 0, 0), tde);
    expect(() => Gregorian(2000, 1, 1, 24, 0, 0, 0), tde);
    expect(() => Gregorian(2000, 1, 1, 0, -1, 0, 0), tde);
    expect(() => Gregorian(2000, 1, 1, 0, 60, 0, 0), tde);
    expect(() => Gregorian(2000, 1, 1, 0, 0, -1, 0), tde);
    expect(() => Gregorian(2000, 1, 1, 0, 0, 60, 0), tde);
    expect(() => Gregorian(2000, 1, 1, 0, 0, 0, -1), tde);
    expect(() => Gregorian(2000, 1, 1, 0, 0, 0, 1000), tde);

    expect(() => Gregorian(2000, -1, 1, 0, 0, 0, 0), tde);
    expect(() => Gregorian(2000, -1, 1, 0, -1, 0, 0), tde);
    expect(() => Gregorian(2000, -1, 1, 0, 0, 0, 1000), tde);
  });

  test('Jalali.isLeapYear', () {
    expect(Jalali(-12).isLeapYear(), true);
    expect(Jalali(12).isLeapYear(), false);
    expect(Jalali(153).isLeapYear(), true);
    expect(Jalali(981).isLeapYear(), false);
    expect(Jalali(983).isLeapYear(), true);
    expect(Jalali(1393).isLeapYear(), false);
    expect(Jalali(1394).isLeapYear(), false);
    expect(Jalali(1395).isLeapYear(), true);
    expect(Jalali(1396).isLeapYear(), false);

    expect(Jalali(1395, 1, 2, 3, 4, 5, 6).isLeapYear(), true);
    expect(Jalali(1396, 1, 2, 3, 4, 5, 6).isLeapYear(), false);
  });

  test('Gregorian.isLeapYear', () {
    expect(Gregorian(801).isLeapYear(), false);
    expect(Gregorian(804).isLeapYear(), true);
    expect(Gregorian(840).isLeapYear(), true);
    expect(Gregorian(900).isLeapYear(), false);
    expect(Gregorian(1000).isLeapYear(), false);
    expect(Gregorian(1100).isLeapYear(), false);
    expect(Gregorian(1004).isLeapYear(), true);
    expect(Gregorian(1200).isLeapYear(), true);

    expect(Gregorian(801, 1, 2, 3, 4, 5, 6).isLeapYear(), false);
    expect(Gregorian(804, 1, 2, 3, 4, 5, 6).isLeapYear(), true);
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

    expect(Jalali(1393, 1, 7, 2, 3, 4, 5).monthLength, 31);
    expect(Jalali(1394, 12, 7, 2, 3, 4, 5).monthLength, 29);
  });

  test('Gregorian.monthLength', () {
    expect(Gregorian(801, 1).monthLength, 31);
    expect(Gregorian(801, 2).monthLength, 28);
    expect(Gregorian(2001, 2).monthLength, 28);
    expect(Gregorian(804, 2).monthLength, 29);
    expect(Gregorian(801, 3).monthLength, 31);
    expect(Gregorian(801, 4).monthLength, 30);
    expect(Gregorian(801, 5).monthLength, 31);
    expect(Gregorian(801, 6).monthLength, 30);
    expect(Gregorian(801, 7).monthLength, 31);
    expect(Gregorian(801, 8).monthLength, 31);
    expect(Gregorian(801, 9).monthLength, 30);
    expect(Gregorian(801, 10).monthLength, 31);
    expect(Gregorian(801, 11).monthLength, 30);
    expect(Gregorian(801, 12).monthLength, 31);

    expect(Gregorian(804, 2, 7, 2, 3, 4, 5).monthLength, 29);
    expect(Gregorian(801, 5, 7, 2, 3, 4, 5).monthLength, 31);
  });

  test('Jalali.weekDay', () {
    expect(Jalali(1397, 10, 24).weekDay, 3);
    expect(Jalali(1397, 10, 11).weekDay, 4);
    expect(Jalali(1305, 1, 5).weekDay, 7);
    expect(Jalali(1305, 1, 6).weekDay, 1);

    expect(Jalali(1305, 1, 6, 1, 2, 3, 4).weekDay, 1);
  });

  test('Gregorian.weekDay', () {
    expect(Gregorian(1969, 7, 20).weekDay, 7);
    expect(Gregorian(2019, 1, 14).weekDay, 1);
    expect(Gregorian(2019, 1, 10).weekDay, 4);

    expect(Gregorian(2019, 1, 10, 1, 2, 3, 4).weekDay, 4);
  });

  // todo ... until here
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
    final j = Jalali.now();
    expect(j.formatter.date, j);
    expect(JalaliFormatter(j).date, j);
  });

  test('GregorianFormatter(date)', () {
    final g = Gregorian.now();
    expect(g.formatter.date, g);
    expect(GregorianFormatter(g).date, g);
  });

  test('JalaliFormatter.yyyy', () {
    expect(Jalali(0).formatter.yyyy, '0000');
    expect(Jalali(1).formatter.yyyy, '0001');
    expect(Jalali(12).formatter.yyyy, '0012');
    expect(Jalali(123).formatter.yyyy, '0123');
    expect(Jalali(1234).formatter.yyyy, '1234');
    expect(Jalali(2222).formatter.yyyy, '2222');

    expect(() => Jalali(-15).formatter.yyyy, throwsStateError);
    expect(() => Jalali(-1).formatter.yyyy, throwsStateError);
    expect(() => _MockJalali(10000).formatter.yyyy, throwsStateError);
    expect(() => _MockJalali(123456).formatter.yyyy, throwsStateError);
  });

  test('GregorianFormatter.yyyy', () {
    expect(_MockGregorian(0).formatter.yyyy, '0000');
    expect(_MockGregorian(1).formatter.yyyy, '0001');
    expect(_MockGregorian(12).formatter.yyyy, '0012');
    expect(_MockGregorian(123).formatter.yyyy, '0123');
    expect(_MockGregorian(1234).formatter.yyyy, '1234');
    expect(_MockGregorian(2222).formatter.yyyy, '2222');

    expect(Gregorian(650).formatter.yyyy, '0650');
    expect(Gregorian(1234).formatter.yyyy, '1234');

    expect(() => _MockGregorian(-15).formatter.yyyy, throwsStateError);
    expect(() => _MockGregorian(-1).formatter.yyyy, throwsStateError);
    expect(() => _MockGregorian(10000).formatter.yyyy, throwsStateError);
    expect(() => _MockGregorian(123456).formatter.yyyy, throwsStateError);
  });

  test('JalaliFormatter.yy', () {
    expect(Jalali(1000).formatter.yy, '00');
    expect(Jalali(2100).formatter.yy, '00');
    expect(Jalali(3005).formatter.yy, '05');
    expect(Jalali(3012).formatter.yy, '12');
    expect(Jalali(2299).formatter.yy, '99');

    expect(() => Jalali(999).formatter.yy, throwsStateError);
    expect(() => Jalali(22).formatter.yy, throwsStateError);
    expect(() => Jalali(5).formatter.yy, throwsStateError);
    expect(() => Jalali(-5).formatter.yy, throwsStateError);
    expect(() => Jalali(-15).formatter.yy, throwsStateError);

    expect(() => _MockJalali(12345).formatter.yy, throwsStateError);
  });

  test('GregorianFormatter.yy', () {
    expect(Gregorian(1000).formatter.yy, '00');
    expect(Gregorian(2100).formatter.yy, '00');
    expect(Gregorian(3005).formatter.yy, '05');
    expect(Gregorian(3512).formatter.yy, '12');
    expect(Gregorian(2299).formatter.yy, '99');

    expect(() => Gregorian(999).formatter.yy, throwsStateError);
    expect(() => Gregorian(600).formatter.yy, throwsStateError);

    expect(() => _MockGregorian(999).formatter.yy, throwsStateError);
    expect(() => _MockGregorian(600).formatter.yy, throwsStateError);
    expect(() => _MockGregorian(22).formatter.yy, throwsStateError);
    expect(() => _MockGregorian(5).formatter.yy, throwsStateError);
    expect(() => _MockGregorian(-5).formatter.yy, throwsStateError);
    expect(() => _MockGregorian(-15).formatter.yy, throwsStateError);

    expect(() => _MockGregorian(12345).formatter.yy, throwsStateError);
  });

  test('JalaliFormatter.y', () {
    expect(Jalali(0).formatter.y, '0');
    expect(Jalali(1).formatter.y, '1');
    expect(Jalali(15).formatter.y, '15');
    expect(Jalali(137).formatter.y, '137');
    expect(Jalali(1370).formatter.y, '1370');

    expect(_MockJalali(123456).formatter.y, '123456');

    expect(() => Jalali(-1).formatter.y, throwsStateError);
  });

  test('GregorianFormatter.y', () {
    expect(Gregorian(561).formatter.y, '561');
    expect(Gregorian(1562).formatter.y, '1562');
    expect(Gregorian(3790).formatter.y, '3790');

    expect(_MockGregorian(123456).formatter.y, '123456');
    expect(_MockGregorian(12).formatter.y, '12');
    expect(_MockGregorian(5).formatter.y, '5');
    expect(_MockGregorian(0).formatter.y, '0');

    expect(() => _MockGregorian(-1).formatter.y, throwsStateError);
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

  test('Jalali.fromDateTime', () {
    final dt = DateTime(2019, 12, 25);
    final j1 = Jalali.fromDateTime(dt);
    final j2 = Jalali(1398, 10, 4);
    expect(j1, j2);
  });

  test('DateTime.toJalali', () {
    final dt = DateTime(2019, 12, 25);
    final j1 = dt.toJalali();
    final j2 = Jalali(1398, 10, 4);
    expect(j1, j2);
  });

  test('Gregorian.fromDateTime', () {
    final dt = DateTime(2000, 10, 5);
    final g1 = Gregorian.fromDateTime(dt);
    final g2 = Gregorian(2000, 10, 5);
    expect(g1, g2);
  });

  test('DateTime.toGregorian', () {
    final dt = DateTime(2000, 10, 5);
    final g1 = dt.toGregorian();
    final g2 = Gregorian(2000, 10, 5);
    expect(g1, g2);
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
    expect(dt.hour, 0);
    expect(dt.minute, 0);
    expect(dt.second, 0);
    expect(dt.millisecond, 0);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, false);
  });

  test('Jalali.toDateTime(...)', () {
    final j = Jalali(2019, 8, 28, 1, 2, 3, 4);
    final dt = j.toDateTime();
    final g = j.toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 1);
    expect(dt.minute, 2);
    expect(dt.second, 3);
    expect(dt.millisecond, 4);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, false);
  });

  test('Gregorian.toDateTime', () {
    final g = Gregorian(2019, 8, 28);
    final dt = g.toDateTime();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 0);
    expect(dt.minute, 0);
    expect(dt.second, 0);
    expect(dt.millisecond, 0);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, false);
  });

  test('Gregorian.toDateTime(...)', () {
    final g = Gregorian(2019, 8, 28, 1, 2, 3, 4);
    final dt = g.toDateTime();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 1);
    expect(dt.minute, 2);
    expect(dt.second, 3);
    expect(dt.millisecond, 4);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, false);
  });

  test('Jalali.toUtcDateTime', () {
    final j = Jalali(1398, 6, 6);
    final dt = j.toUtcDateTime();
    final g = j.toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 0);
    expect(dt.minute, 0);
    expect(dt.second, 0);
    expect(dt.millisecond, 0);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, true);
  });

  test('Jalali.toUtcDateTime(...)', () {
    final j = Jalali(2019, 8, 28, 1, 2, 3, 4);
    final dt = j.toUtcDateTime();
    final g = j.toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 1);
    expect(dt.minute, 2);
    expect(dt.second, 3);
    expect(dt.millisecond, 4);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, true);
  });

  test('Gregorian.toUtcDateTime', () {
    final g = Gregorian(2019, 8, 28);
    final dt = g.toUtcDateTime();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 0);
    expect(dt.minute, 0);
    expect(dt.second, 0);
    expect(dt.millisecond, 0);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, true);
  });

  test('Gregorian.toUtcDateTime(...)', () {
    final g = Gregorian(2019, 8, 28, 1, 2, 3, 4);
    final dt = g.toUtcDateTime();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);
    expect(dt.hour, 1);
    expect(dt.minute, 2);
    expect(dt.second, 3);
    expect(dt.millisecond, 4);
    expect(dt.microsecond, 0);
    expect(dt.isUtc, true);
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
  });

  test('Gregorian.addYears', () {
    expect(Gregorian(1300, 2, 10).addYears(0), Gregorian(1300, 2, 10));
    expect(Gregorian(1300, 2, 10).addYears(10), Gregorian(1310, 2, 10));
    expect(Gregorian(1300, 2, 10).addYears(-10), Gregorian(1290, 2, 10));
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
  });

  test('Jalali.addDays', () {
    expect(Jalali(1300, 2, 10).addDays(0), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).addDays(5), Jalali(1300, 2, 15));
    expect(Jalali(1300, 2, 10).addDays(-10), Jalali(1300, 1, 31));
    expect(Jalali(1300, 1, 31).addDays(36), Jalali(1300, 3, 5));
    expect(Jalali(1400, 1, 1).addDays(365), Jalali(1401, 1, 1));
  });

  test('Gregorian.addDays', () {
    expect(Gregorian(2000, 2, 10).addDays(0), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10).addDays(5), Gregorian(2000, 2, 15));
    expect(Gregorian(2000, 2, 10).addDays(-10), Gregorian(2000, 1, 31));
    expect(Gregorian(2000, 1, 31).addDays(34), Gregorian(2000, 3, 5));
    expect(Gregorian(2000, 1, 1).addDays(366), Gregorian(2001, 1, 1));
  });

  test('Jalali.withYear', () {
    expect(Jalali(1398, 10, 20).withYear(1398), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withYear(1300), Jalali(1300, 10, 20));
    expect(Jalali(1398, 10, 20).withYear(1400), Jalali(1400, 10, 20));
  });

  test('Gregorian.withYear', () {
    expect(Gregorian(2020, 10, 20).withYear(2020), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withYear(2010), Gregorian(2010, 10, 20));
    expect(Gregorian(2030, 10, 20).withYear(2030), Gregorian(2030, 10, 20));
  });

  test('Jalali.withMonth', () {
    expect(Jalali(1398, 10, 20).withMonth(10), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withMonth(1), Jalali(1398, 1, 20));
    expect(Jalali(1398, 10, 20).withMonth(12), Jalali(1398, 12, 20));
  });

  test('Gregorian.withMonth', () {
    expect(Gregorian(2020, 10, 20).withMonth(10), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withMonth(1), Gregorian(2020, 1, 20));
    expect(Gregorian(2020, 10, 20).withMonth(12), Gregorian(2020, 12, 20));
  });

  test('Jalali.withDay', () {
    expect(Jalali(1398, 10, 20).withDay(20), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withDay(15), Jalali(1398, 10, 15));
    expect(Jalali(1398, 10, 20).withDay(25), Jalali(1398, 10, 25));
  });

  test('Gregorian.withDay', () {
    expect(Gregorian(2020, 10, 20).withDay(20), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withDay(15), Gregorian(2020, 10, 15));
    expect(Gregorian(2020, 10, 20).withDay(25), Gregorian(2020, 10, 25));
  });

  test('DateException(message)', () {
    final exception = DateException('I am a message');

    expect(exception, isA<DateException>());
    expect(() => throw exception, tde);
    expect(exception.toString(), 'DateException: I am a message');
  });

  test('Jalali.{MIN, MAX}', () {
    final min = Jalali.fromJulianDayNumber(Date.minJulianDayNumber);
    expect(min, Jalali.min);
    expect(min.year, Jalali.min.year);
    expect(min.month, Jalali.min.month);
    expect(min.day, Jalali.min.day);
    expect(min.monthLength, Jalali.min.monthLength);
    expect(min.isLeapYear(), Jalali.min.isLeapYear());

    final max = Jalali.fromJulianDayNumber(
      Date.maxJulianDayNumber,
      23,
      59,
      59,
      999,
    );
    expect(max, Jalali.max);
    expect(max.year, Jalali.max.year);
    expect(max.month, Jalali.max.month);
    expect(max.day, Jalali.max.day);
    expect(max.monthLength, Jalali.max.monthLength);
    expect(max.isLeapYear(), Jalali.max.isLeapYear());
  });

  test('Gregorian.{MIN, MAX}', () {
    final min = Gregorian.fromJulianDayNumber(Date.minJulianDayNumber);
    expect(min, Gregorian.min);
    expect(min.year, Gregorian.min.year);
    expect(min.month, Gregorian.min.month);
    expect(min.day, Gregorian.min.day);
    expect(min.monthLength, Gregorian.min.monthLength);
    expect(min.isLeapYear(), Gregorian.min.isLeapYear());

    final max = Gregorian.fromJulianDayNumber(
      Date.maxJulianDayNumber,
      23,
      59,
      59,
      999,
    );
    expect(max, Gregorian.max);
    expect(max.year, Gregorian.max.year);
    expect(max.month, Gregorian.max.month);
    expect(max.day, Gregorian.max.day);
    expect(max.monthLength, Gregorian.max.monthLength);
    expect(max.isLeapYear(), Gregorian.max.isLeapYear());
  });

  test('_JalaliCalculation.calculate', () {
    // check a 'should not happen' condition
    // can't use since we changed impl
    // expect(() => _MockJalali(-62).isLeapYear(), throwsStateError);
    // expect(() => _MockJalali(3178).isLeapYear(), throwsStateError);

    // check 'leapJ += 1;'
    expect(Jalali(1177).isLeapYear(), false);
    expect(Jalali(1177, 1, 1).toGregorian(), Gregorian(1798, 3, 21));
  });

  test('Jalali.^', () {
    expect(Jalali(1400, 2, 30) ^ Jalali(1375, 8, 3), 8974);
  });

  test('Gregorian.^', () {
    expect(Gregorian(2021, 5, 20) ^ Gregorian(1996, 10, 24), 8974);
  });

  test('Date.^', () {
    expect(Jalali(1400, 2, 30) ^ Gregorian(1996, 10, 24), 8974);
    expect(Gregorian(2021, 5, 20) ^ Jalali(1375, 8, 3), 8974);
  });

  test('Jalali.distanceFrom', () {
    expect(Jalali(1400, 2, 30).distanceFrom(Jalali(1375, 8, 3)), 8974);
  });

  test('Gregorian.distanceFrom', () {
    expect(Gregorian(2021, 5, 20).distanceFrom(Gregorian(1996, 10, 24)), 8974);
  });

  test('Jalali.distanceFrom', () {
    expect(Jalali(1400, 2, 30).distanceTo(Jalali(1375, 8, 3)), -8974);
  });

  test('Gregorian.distanceFrom', () {
    expect(Gregorian(2021, 5, 20).distanceTo(Gregorian(1996, 10, 24)), -8974);
  });
}

/// Mock Gregorian
///
/// no check on inputs ...
class _MockGregorian extends Date implements Gregorian {
  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  final int hour;

  @override
  final int minute;

  @override
  final int second;

  @override
  final int millisecond;

  const _MockGregorian(
    this.year, [
    this.month = 1,
    this.day = 1,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
  ]);

  @override
  GregorianFormatter get formatter => GregorianFormatter(this);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('mocked');
}

/// Mock Jalali
///
/// no check on inputs ...
class _MockJalali extends Date implements Jalali {
  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  final int hour;

  @override
  final int minute;

  @override
  final int second;

  @override
  final int millisecond;

  const _MockJalali(
    this.year, [
    this.month = 1,
    this.day = 1,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
  ]);

  @override
  JalaliFormatter get formatter => JalaliFormatter(this);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('mocked');
}
