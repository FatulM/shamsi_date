// Copyright 2018 - 2024, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:shamsi_date/shamsi_date.dart';
import 'package:test/test.dart';

Matcher get tde => throwsA(isA<DateException>());

void main() {
  test('_MockJalali(year, month, day).{year, month, day}', () {
    final d1 = _MockJalali(1300);

    expect(d1.year, 1300);
    expect(d1.month, 1);
    expect(d1.day, 1);
    expect(d1.hour, 0);
    expect(d1.minute, 0);
    expect(d1.second, 0);
    expect(d1.millisecond, 0);

    final d2 = _MockJalali(1300, 2, 3, 4, 5, 6, 7);

    expect(d2.year, 1300);
    expect(d2.month, 2);
    expect(d2.day, 3);
    expect(d2.hour, 4);
    expect(d2.minute, 5);
    expect(d2.second, 6);
    expect(d2.millisecond, 7);
  });

  test('_MockGregorian(year, month, day).{year, month, day}', () {
    final d1 = _MockGregorian(2000);

    expect(d1.year, 2000);
    expect(d1.month, 1);
    expect(d1.day, 1);
    expect(d1.hour, 0);
    expect(d1.minute, 0);
    expect(d1.second, 0);
    expect(d1.millisecond, 0);

    final d2 = _MockGregorian(2000, 2, 3, 4, 5, 6, 7);

    expect(d2.year, 2000);
    expect(d2.month, 2);
    expect(d2.day, 3);
    expect(d2.hour, 4);
    expect(d2.minute, 5);
    expect(d2.second, 6);
    expect(d2.millisecond, 7);
  });

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

  test('Jalali.{ compareTo , > , >= , == ,  <= , < }', () {
    final j1 = Jalali(1397, 10, 24);
    final j1c = Jalali(1397, 10, 24);
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
    expect(j1 == j1c, true);
    expect(j1 > j3, false);
    expect(j1 >= j3, false);
    expect(j3 > j1, true);
    expect(j3 < j1, false);
    expect(j3 <= j1, false);
    expect(j1 < j3, true);

    final j5 = Jalali(1000, 1, 2, 3, 4, 5, 6);

    expect(j5.compareTo(j5) == 0, true);
    expect(Jalali(1000, 1, 1, 3, 4, 5, 6).compareTo(j5) < 0, true);
    expect(Jalali(1000, 1, 2, 1, 4, 5, 6).compareTo(j5) < 0, true);
    expect(Jalali(1000, 1, 2, 3, 1, 5, 6).compareTo(j5) < 0, true);
    expect(Jalali(1000, 1, 2, 3, 4, 1, 6).compareTo(j5) < 0, true);
    expect(Jalali(1000, 1, 2, 3, 4, 5, 1).compareTo(j5) < 0, true);
    expect(Jalali(1000, 1, 3, 2, 4, 5, 6).compareTo(j5) > 0, true);
    expect(Jalali(1000, 1, 2, 4, 3, 5, 6).compareTo(j5) > 0, true);
    expect(Jalali(1000, 1, 2, 3, 5, 4, 6).compareTo(j5) > 0, true);
    expect(Jalali(1000, 1, 2, 3, 4, 6, 5).compareTo(j5) > 0, true);
    expect(Jalali(1000, 1, 2, 3, 4, 5, 7).compareTo(j5) > 0, true);

    expect(j5 == j5, true);
    expect(j5 >= j5, true);
    expect(j5 <= j5, true);
    expect(Jalali(1000, 1, 1, 3, 4, 5, 6) < j5, true);
    expect(Jalali(1000, 1, 2, 1, 4, 5, 6) < j5, true);
    expect(Jalali(1000, 1, 2, 3, 1, 5, 6) < j5, true);
    expect(Jalali(1000, 1, 2, 3, 4, 1, 6) < j5, true);
    expect(Jalali(1000, 1, 2, 3, 4, 5, 1) < j5, true);
    expect(Jalali(1000, 1, 3, 2, 4, 5, 6) > j5, true);
    expect(Jalali(1000, 1, 2, 4, 3, 5, 6) > j5, true);
    expect(Jalali(1000, 1, 2, 3, 5, 4, 6) > j5, true);
    expect(Jalali(1000, 1, 2, 3, 4, 6, 5) > j5, true);
    expect(Jalali(1000, 1, 2, 3, 4, 5, 7) > j5, true);
  });

  test('Gregorian.{ compareTo , > , >= , == ,  <= , < }', () {
    final g1 = Gregorian(2017, 10, 24);
    final g1c = Gregorian(2017, 10, 24);
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
    expect(g1 == g1c, true);
    expect(g1 > g3, false);
    expect(g1 >= g3, false);
    expect(g3 > g1, true);
    expect(g3 < g1, false);
    expect(g3 <= g1, false);
    expect(g1 < g3, true);

    final g5 = Gregorian(1000, 1, 2, 3, 4, 5, 6);

    expect(g5.compareTo(g5) == 0, true);
    expect(Gregorian(1000, 1, 1, 3, 4, 5, 6).compareTo(g5) < 0, true);
    expect(Gregorian(1000, 1, 2, 1, 4, 5, 6).compareTo(g5) < 0, true);
    expect(Gregorian(1000, 1, 2, 3, 1, 5, 6).compareTo(g5) < 0, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 1, 6).compareTo(g5) < 0, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 5, 1).compareTo(g5) < 0, true);
    expect(Gregorian(1000, 1, 3, 2, 4, 5, 6).compareTo(g5) > 0, true);
    expect(Gregorian(1000, 1, 2, 4, 3, 5, 6).compareTo(g5) > 0, true);
    expect(Gregorian(1000, 1, 2, 3, 5, 4, 6).compareTo(g5) > 0, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 6, 5).compareTo(g5) > 0, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 5, 7).compareTo(g5) > 0, true);

    expect(g5 == g5, true);
    expect(g5 >= g5, true);
    expect(g5 <= g5, true);
    expect(Gregorian(1000, 1, 1, 3, 4, 5, 6) < g5, true);
    expect(Gregorian(1000, 1, 2, 1, 4, 5, 6) < g5, true);
    expect(Gregorian(1000, 1, 2, 3, 1, 5, 6) < g5, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 1, 6) < g5, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 5, 1) < g5, true);
    expect(Gregorian(1000, 1, 3, 2, 4, 5, 6) > g5, true);
    expect(Gregorian(1000, 1, 2, 4, 3, 5, 6) > g5, true);
    expect(Gregorian(1000, 1, 2, 3, 5, 4, 6) > g5, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 6, 5) > g5, true);
    expect(Gregorian(1000, 1, 2, 3, 4, 5, 7) > g5, true);
  });

  test('JalaliFormatter(date).{date}', () {
    final j = Jalali.now();
    expect(j.formatter.date, j);
    expect(JalaliFormatter(j).date, j);
  });

  test('GregorianFormatter(date).{date}', () {
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

    expect(Jalali(2222, 1, 2, 3, 4, 5, 6).formatter.yyyy, '2222');

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

    expect(Gregorian(1234, 1, 2, 3, 4, 5, 6).formatter.yyyy, '1234');

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

    expect(Jalali(2299, 1, 2, 3, 5, 6).formatter.yy, '99');

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

    expect(
      () => Gregorian(600, 1, 2, 3, 4, 5, 6).formatter.yy,
      throwsStateError,
    );

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

    expect(Jalali(1370, 1, 2, 3, 4, 5, 6).formatter.y, '1370');

    expect(_MockJalali(123456).formatter.y, '123456');

    expect(() => Jalali(-1).formatter.y, throwsStateError);
  });

  test('GregorianFormatter.y', () {
    expect(Gregorian(561).formatter.y, '561');
    expect(Gregorian(1562).formatter.y, '1562');
    expect(Gregorian(3790).formatter.y, '3790');

    expect(Gregorian(3790, 1, 2, 3, 5, 6).formatter.y, '3790');

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

    final j3 = Jalali(1397, 1, 3, 1, 2, 3, 4);
    final f3 = j3.formatter;

    expect(f3.yyyy, '1397');
    expect(f3.yy, '97');
    expect(f3.y, '1397');
    expect(f3.mm, '01');
    expect(f3.m, '1');
    expect(f3.dd, '03');
    expect(f3.d, '3');
    expect(f3.mN, 'فروردین');
    expect(f3.wN, 'جمعه');
  });

  test('Jalali.formatter.mNAf', () {
    final j1 = Jalali(1397, 1, 3);
    final f1 = j1.formatter;

    expect(f1.mNAf, 'حمل');

    final j2 = Jalali(1397, 4, 3, 1, 2, 3, 4);
    final f2 = j2.formatter;

    expect(f2.mNAf, 'سرطان');
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

    final g3 = Gregorian(2007, 1, 3, 1, 2, 3, 4);
    final f3 = g3.formatter;

    expect(f3.yyyy, '2007');
    expect(f3.yy, '07');
    expect(f3.y, '2007');
    expect(f3.mm, '01');
    expect(f3.m, '1');
    expect(f3.dd, '03');
    expect(f3.d, '3');
    expect(f3.mN, 'January');
    expect(f3.wN, 'Wednesday');
  });

  test('Jalali.copy', () {
    expect(Jalali(1395, 10, 21).copy(), Jalali(1395, 10, 21));
    expect(Jalali(1395, 10, 21).copy(year: 1390), Jalali(1390, 10, 21));
    expect(Jalali(1395, 10, 21).copy(month: 5), Jalali(1395, 5, 21));
    expect(Jalali(1395, 10, 21).copy(day: 10), Jalali(1395, 10, 10));
    expect(
      Jalali(1395, 10, 21).copy(year: 1390, month: 5, day: 10),
      Jalali(1390, 5, 10),
    );

    expect(
      Jalali(1395, 10, 21, 1, 2, 3, 4).copy(
        year: 1390,
        month: 5,
        day: 10,
        hour: 5,
        minute: 6,
        second: 7,
        millisecond: 8,
      ),
      Jalali(1390, 5, 10, 5, 6, 7, 8),
    );
  });

  test('Gregorian.copy', () {
    expect(Gregorian(2010, 10, 21).copy(), Gregorian(2010, 10, 21));
    expect(Gregorian(2010, 10, 21).copy(year: 2000), Gregorian(2000, 10, 21));
    expect(Gregorian(2010, 10, 21).copy(month: 5), Gregorian(2010, 5, 21));
    expect(Gregorian(2010, 10, 21).copy(day: 10), Gregorian(2010, 10, 10));
    expect(
      Gregorian(2010, 10, 21).copy(year: 2000, month: 5, day: 10),
      Gregorian(2000, 5, 10),
    );

    expect(
      Gregorian(2010, 10, 21, 1, 2, 3, 4).copy(
        year: 2000,
        month: 5,
        day: 10,
        hour: 5,
        minute: 6,
        second: 7,
        millisecond: 8,
      ),
      Gregorian(2000, 5, 10, 5, 6, 7, 8),
    );
  });

  test('Jalali.fromDateTime', () {
    final dt = DateTime(2019, 12, 25);
    final j1 = Jalali.fromDateTime(dt);
    final j2 = Jalali(1398, 10, 4);
    expect(j1, j2);

    final dtt = DateTime(2019, 12, 25, 1, 2, 3, 4);
    final j1t = Jalali.fromDateTime(dtt);
    final j2t = Jalali(1398, 10, 4, 1, 2, 3, 4);
    expect(j1t, j2t);
  });

  test('DateTime.toJalali', () {
    final dt = DateTime(2019, 12, 25);
    final j1 = dt.toJalali();
    final j2 = Jalali(1398, 10, 4);
    expect(j1, j2);

    final dtt = DateTime(2019, 12, 25, 1, 2, 3, 4);
    final j1t = dtt.toJalali();
    final j2t = Jalali(1398, 10, 4, 1, 2, 3, 4);
    expect(j1t, j2t);
  });

  test('Gregorian.fromDateTime', () {
    final dt = DateTime(2000, 10, 5);
    final g1 = Gregorian.fromDateTime(dt);
    final g2 = Gregorian(2000, 10, 5);
    expect(g1, g2);

    final dtt = DateTime(2000, 10, 5, 1, 2, 3, 4);
    final g1t = Gregorian.fromDateTime(dtt);
    final g2t = Gregorian(2000, 10, 5, 1, 2, 3, 4);
    expect(g1t, g2t);
  });

  test('DateTime.toGregorian', () {
    final dt = DateTime(2000, 10, 5);
    final g1 = dt.toGregorian();
    final g2 = Gregorian(2000, 10, 5);
    expect(g1, g2);

    final dtt = DateTime(2000, 10, 5, 1, 2, 3, 4);
    final g1t = dtt.toGregorian();
    final g2t = Gregorian(2000, 10, 5, 1, 2, 3, 4);
    expect(g1t, g2t);
  });

  test('Jalali.now UNRELIABLE_TEST', () {
    final dt = DateTime.now();
    final g = Jalali.now().toGregorian();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);

    expect(g.hour, dt.hour);
    expect(g.minute, dt.minute);
    expect(g.second, dt.second);
    // todo check difference using duration
    // can not guarantee !
    // expect(g.millisecond, dt.millisecond);
  });

  test('Gregorian.now UNRELIABLE_TEST', () {
    final dt = DateTime.now();
    final g = Gregorian.now();
    expect(g.year, dt.year);
    expect(g.month, dt.month);
    expect(g.day, dt.day);

    expect(g.hour, dt.hour);
    expect(g.minute, dt.minute);
    expect(g.second, dt.second);
    // todo check difference using duration
    // can not guarantee !
    // expect(g.millisecond, dt.millisecond);
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

    final jt = Jalali(2019, 8, 28, 1, 2, 3, 4);
    final dtt = jt.toDateTime();
    final gt = jt.toGregorian();
    expect(gt.year, dtt.year);
    expect(gt.month, dtt.month);
    expect(gt.day, dtt.day);
    expect(dtt.hour, 1);
    expect(dtt.minute, 2);
    expect(dtt.second, 3);
    expect(dtt.millisecond, 4);
    expect(dtt.microsecond, 0);
    expect(dtt.isUtc, false);
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

    final gt = Gregorian(2019, 8, 28, 1, 2, 3, 4);
    final dtt = gt.toDateTime();
    expect(gt.year, dtt.year);
    expect(gt.month, dtt.month);
    expect(gt.day, dtt.day);
    expect(dtt.hour, 1);
    expect(dtt.minute, 2);
    expect(dtt.second, 3);
    expect(dtt.millisecond, 4);
    expect(dtt.microsecond, 0);
    expect(dtt.isUtc, false);
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

    final jt = Jalali(2019, 8, 28, 1, 2, 3, 4);
    final dtt = jt.toUtcDateTime();
    final gt = jt.toGregorian();
    expect(gt.year, dtt.year);
    expect(gt.month, dtt.month);
    expect(gt.day, dtt.day);
    expect(dtt.hour, 1);
    expect(dtt.minute, 2);
    expect(dtt.second, 3);
    expect(dtt.millisecond, 4);
    expect(dtt.microsecond, 0);
    expect(dtt.isUtc, true);
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

    final gt = Gregorian(2019, 8, 28, 1, 2, 3, 4);
    final dtt = gt.toUtcDateTime();
    expect(gt.year, dtt.year);
    expect(gt.month, dtt.month);
    expect(gt.day, dtt.day);
    expect(dtt.hour, 1);
    expect(dtt.minute, 2);
    expect(dtt.second, 3);
    expect(dtt.millisecond, 4);
    expect(dtt.microsecond, 0);
    expect(dtt.isUtc, true);
  });

  test('Jalali.hashCode', () {
    final j1 = Jalali(1398, 6, 6);
    final j2 = Jalali(1398, 6, 6);
    expect(j2.hashCode, j1.hashCode);
    expect(j1.copy(year: 1397).hashCode != j1.hashCode, true);
    expect(j1.copy(month: 5).hashCode != j1.hashCode, true);
    expect(j1.copy(day: 7).hashCode != j1.hashCode, true);

    expect(j1.copy(hour: 7).hashCode != j1.hashCode, true);
    expect(j1.copy(minute: 7).hashCode != j1.hashCode, true);
    expect(j1.copy(second: 7).hashCode != j1.hashCode, true);
    expect(j1.copy(millisecond: 7).hashCode != j1.hashCode, true);
  });

  test('Gregorian.hashCode', () {
    final g1 = Gregorian(2019, 8, 28);
    final g2 = Gregorian(2019, 8, 28);
    expect(g2.hashCode, g1.hashCode);
    expect(g1.copy(year: 2018).hashCode != g1.hashCode, true);
    expect(g1.copy(month: 7).hashCode != g1.hashCode, true);
    expect(g1.copy(day: 1).hashCode != g1.hashCode, true);

    expect(g1.copy(hour: 7).hashCode != g1.hashCode, true);
    expect(g1.copy(minute: 7).hashCode != g1.hashCode, true);
    expect(g1.copy(second: 7).hashCode != g1.hashCode, true);
    expect(g1.copy(millisecond: 7).hashCode != g1.hashCode, true);
  });

  test('Jalali.+', () {
    expect(Jalali(1300, 2, 10) + 0, Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10) + 5, Jalali(1300, 2, 15));
    expect(Jalali(1300, 2, 10) + (-10), Jalali(1300, 1, 31));
    expect(Jalali(1300, 1, 31) + 36, Jalali(1300, 3, 5));
    expect(Jalali(1400, 1, 1) + 365, Jalali(1401, 1, 1));

    expect(
      Jalali(1400, 1, 1, 1, 2, 3, 4) + 365,
      Jalali(1401, 1, 1, 1, 2, 3, 4),
    );
  });

  test('Gregorian.+', () {
    expect(Gregorian(2000, 2, 10) + 0, Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10) + 5, Gregorian(2000, 2, 15));
    expect(Gregorian(2000, 2, 10) + (-10), Gregorian(2000, 1, 31));
    expect(Gregorian(2000, 1, 31) + 34, Gregorian(2000, 3, 5));
    expect(Gregorian(2000, 1, 1) + 366, Gregorian(2001, 1, 1));

    expect(
      Gregorian(2000, 1, 1, 1, 2, 3, 4) + 366,
      Gregorian(2001, 1, 1, 1, 2, 3, 4),
    );
  });

  test('Jalali.-', () {
    expect(Jalali(1300, 2, 10) - 0, Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10) - (-22), Jalali(1300, 3, 1));
    expect(Jalali(1300, 2, 15) - 5, Jalali(1300, 2, 10));
    expect(Jalali(1300, 3, 5) - 36, Jalali(1300, 1, 31));
    expect(Jalali(1401, 1, 1) - 365, Jalali(1400, 1, 1));

    expect(
      Jalali(1401, 1, 1, 1, 2, 3, 4) - 365,
      Jalali(1400, 1, 1, 1, 2, 3, 4),
    );
  });

  test('Gregorian.-', () {
    expect(Gregorian(2000, 2, 10) - 0, Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 15) - 5, Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 1, 31) - (-10), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 3, 5) - 34, Gregorian(2000, 1, 31));
    expect(Gregorian(2001, 1, 1) - 366, Gregorian(2000, 1, 1));

    expect(
      Gregorian(2001, 1, 1, 1, 2, 3, 4) - 366,
      Gregorian(2000, 1, 1, 1, 2, 3, 4),
    );
  });

  test('Jalali.add', () {
    expect(Jalali(1300, 2, 10).add(), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).add(years: 1), Jalali(1301, 2, 10));
    expect(Jalali(1300, 2, 10).add(months: 1), Jalali(1300, 3, 10));
    expect(Jalali(1300, 2, 10).add(days: 1), Jalali(1300, 2, 11));
    expect(
      Jalali(1300, 2, 10).add(years: 10, months: 3, days: 8),
      Jalali(1310, 5, 18),
    );
    expect(
      Jalali(1300, 5, 10).add(years: -10, months: -3, days: -8),
      Jalali(1290, 2, 2),
    );

    expect(
      Jalali(1300, 5, 10, 1, 2, 3, 4).add(
        years: -10,
        months: -3,
        days: -8,
        hours: 1,
        minutes: 2,
        seconds: 3,
        milliseconds: 4,
      ),
      Jalali(1290, 2, 2, 2, 4, 6, 8),
    );
  });

  test('Gregorian.add', () {
    expect(Gregorian(2000, 2, 10).add(), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10).add(years: 1), Gregorian(2001, 2, 10));
    expect(Gregorian(2000, 2, 10).add(months: 1), Gregorian(2000, 3, 10));
    expect(Gregorian(2000, 2, 10).add(days: 1), Gregorian(2000, 2, 11));
    expect(
      Gregorian(2000, 2, 10).add(years: 10, months: 3, days: 8),
      Gregorian(2010, 5, 18),
    );
    expect(
      Gregorian(2000, 5, 10).add(years: -10, months: -3, days: -8),
      Gregorian(1990, 2, 2),
    );

    expect(
      Gregorian(2000, 5, 10, 1, 2, 3, 4).add(
        years: -10,
        months: -3,
        days: -8,
        hours: 1,
        minutes: 2,
        seconds: 3,
        milliseconds: 4,
      ),
      Gregorian(1990, 2, 2, 2, 4, 6, 8),
    );
  });

  test('Jalali.addYears', () {
    expect(Jalali(1300, 2, 10).addYears(0), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).addYears(10), Jalali(1310, 2, 10));
    expect(Jalali(1300, 2, 10).addYears(-10), Jalali(1290, 2, 10));

    expect(
      Jalali(1300, 2, 10, 1, 2, 3, 4).addYears(-10),
      Jalali(1290, 2, 10, 1, 2, 3, 4),
    );
  });

  test('Gregorian.addYears', () {
    expect(Gregorian(1300, 2, 10).addYears(0), Gregorian(1300, 2, 10));
    expect(Gregorian(1300, 2, 10).addYears(10), Gregorian(1310, 2, 10));
    expect(Gregorian(1300, 2, 10).addYears(-10), Gregorian(1290, 2, 10));

    expect(
      Gregorian(1300, 2, 10, 1, 2, 3, 4).addYears(-10),
      Gregorian(1290, 2, 10, 1, 2, 3, 4),
    );
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

    expect(
      Jalali(1300, 2, 10, 1, 2, 3, 4).addMonths(-25),
      Jalali(1298, 1, 10, 1, 2, 3, 4),
    );
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

    expect(
      Gregorian(1300, 2, 10, 1, 2, 3, 4).addMonths(-25),
      Gregorian(1298, 1, 10, 1, 2, 3, 4),
    );
  });

  test('Jalali.addDays', () {
    expect(Jalali(1300, 2, 10).addDays(0), Jalali(1300, 2, 10));
    expect(Jalali(1300, 2, 10).addDays(5), Jalali(1300, 2, 15));
    expect(Jalali(1300, 2, 10).addDays(-10), Jalali(1300, 1, 31));
    expect(Jalali(1300, 1, 31).addDays(36), Jalali(1300, 3, 5));
    expect(Jalali(1400, 1, 1).addDays(365), Jalali(1401, 1, 1));

    expect(
      Jalali(1400, 1, 1, 1, 2, 3, 4).addDays(365),
      Jalali(1401, 1, 1, 1, 2, 3, 4),
    );
  });

  test('Gregorian.addDays', () {
    expect(Gregorian(2000, 2, 10).addDays(0), Gregorian(2000, 2, 10));
    expect(Gregorian(2000, 2, 10).addDays(5), Gregorian(2000, 2, 15));
    expect(Gregorian(2000, 2, 10).addDays(-10), Gregorian(2000, 1, 31));
    expect(Gregorian(2000, 1, 31).addDays(34), Gregorian(2000, 3, 5));
    expect(Gregorian(2000, 1, 1).addDays(366), Gregorian(2001, 1, 1));

    expect(
      Gregorian(2000, 1, 1, 1, 2, 3, 4).addDays(366),
      Gregorian(2001, 1, 1, 1, 2, 3, 4),
    );
  });

  test('Jalali.withYear', () {
    expect(Jalali(1398, 10, 20).withYear(1398), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withYear(1300), Jalali(1300, 10, 20));

    expect(
      Jalali(1398, 10, 20, 1, 2, 3, 4).withYear(1400),
      Jalali(1400, 10, 20, 1, 2, 3, 4),
    );
  });

  test('Gregorian.withYear', () {
    expect(Gregorian(2020, 10, 20).withYear(2020), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withYear(2010), Gregorian(2010, 10, 20));
    expect(Gregorian(2030, 10, 20).withYear(2030), Gregorian(2030, 10, 20));

    expect(
      Gregorian(2030, 10, 20, 1, 2, 3, 4).withYear(2030),
      Gregorian(2030, 10, 20, 1, 2, 3, 4),
    );
  });

  test('Jalali.withMonth', () {
    expect(Jalali(1398, 10, 20).withMonth(10), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withMonth(1), Jalali(1398, 1, 20));
    expect(Jalali(1398, 10, 20).withMonth(12), Jalali(1398, 12, 20));

    expect(
      Jalali(1398, 10, 20, 1, 2, 3, 4).withMonth(12),
      Jalali(1398, 12, 20, 1, 2, 3, 4),
    );
  });

  test('Gregorian.withMonth', () {
    expect(Gregorian(2020, 10, 20).withMonth(10), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withMonth(1), Gregorian(2020, 1, 20));
    expect(Gregorian(2020, 10, 20).withMonth(12), Gregorian(2020, 12, 20));

    expect(
      Gregorian(2020, 10, 20, 1, 2, 3, 4).withMonth(12),
      Gregorian(2020, 12, 20, 1, 2, 3, 4),
    );
  });

  test('Jalali.withDay', () {
    expect(Jalali(1398, 10, 20).withDay(20), Jalali(1398, 10, 20));
    expect(Jalali(1398, 10, 20).withDay(15), Jalali(1398, 10, 15));
    expect(Jalali(1398, 10, 20).withDay(25), Jalali(1398, 10, 25));

    expect(
      Jalali(1398, 10, 20, 1, 2, 3, 4).withDay(25),
      Jalali(1398, 10, 25, 1, 2, 3, 4),
    );
  });

  test('Gregorian.withDay', () {
    expect(Gregorian(2020, 10, 20).withDay(20), Gregorian(2020, 10, 20));
    expect(Gregorian(2020, 10, 20).withDay(15), Gregorian(2020, 10, 15));
    expect(Gregorian(2020, 10, 20).withDay(25), Gregorian(2020, 10, 25));

    expect(
      Gregorian(2020, 10, 20, 1, 2, 3, 4).withDay(25),
      Gregorian(2020, 10, 25, 1, 2, 3, 4),
    );
  });

  test('DateException(message)', () {
    final exception = DateException('I am a message');

    expect(exception, isA<DateException>());
    expect(() => throw exception, tde);
    expect(exception.toString(), 'DateException: I am a message');
  });

  test('Jalali.{MIN, MAX}', () {
    final min = Jalali.fromJulianDayNumber(
      Date.minJulianDayNumber,
      0,
      0,
      0,
      0,
    );
    expect(min, Jalali.min);
    expect(min.year, Jalali.min.year);
    expect(min.month, Jalali.min.month);
    expect(min.day, Jalali.min.day);
    expect(min.monthLength, Jalali.min.monthLength);
    expect(min.isLeapYear(), Jalali.min.isLeapYear());
    expect(min.hour, Jalali.min.hour);
    expect(min.minute, Jalali.min.minute);
    expect(min.second, Jalali.min.second);
    expect(min.millisecond, Jalali.min.millisecond);

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
    expect(max.hour, Jalali.max.hour);
    expect(max.minute, Jalali.max.minute);
    expect(max.second, Jalali.max.second);
    expect(max.millisecond, Jalali.max.millisecond);
  });

  test('Gregorian.{MIN, MAX}', () {
    final min = Gregorian.fromJulianDayNumber(
      Date.minJulianDayNumber,
      0,
      0,
      0,
      0,
    );
    expect(min, Gregorian.min);
    expect(min.year, Gregorian.min.year);
    expect(min.month, Gregorian.min.month);
    expect(min.day, Gregorian.min.day);
    expect(min.monthLength, Gregorian.min.monthLength);
    expect(min.isLeapYear(), Gregorian.min.isLeapYear());
    expect(min.hour, Gregorian.min.hour);
    expect(min.minute, Gregorian.min.minute);
    expect(min.second, Gregorian.min.second);
    expect(min.millisecond, Gregorian.min.millisecond);

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
    expect(max.hour, Gregorian.max.hour);
    expect(max.minute, Gregorian.max.minute);
    expect(max.second, Gregorian.max.second);
    expect(max.millisecond, Gregorian.max.millisecond);
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

    expect(
      Jalali(1400, 2, 30, 1, 2, 3, 4) ^ Jalali(1375, 8, 3, 1, 2, 3, 4),
      8974,
    );
  });

  test('Gregorian.^', () {
    expect(Gregorian(2021, 5, 20) ^ Gregorian(1996, 10, 24), 8974);

    expect(
      Gregorian(2021, 5, 20, 1, 2, 3, 4) ^ Gregorian(1996, 10, 24, 1, 2, 3, 4),
      8974,
    );
  });

  test('Date.^', () {
    expect(Jalali(1400, 2, 30) ^ Gregorian(1996, 10, 24), 8974);
    expect(Gregorian(2021, 5, 20) ^ Jalali(1375, 8, 3), 8974);

    expect(
      Jalali(1400, 2, 30, 1, 2, 3, 4) ^ Gregorian(1996, 10, 24, 1, 2, 3, 4),
      8974,
    );
  });

  test('Jalali.distanceFrom', () {
    expect(Jalali(1400, 2, 30).distanceFrom(Jalali(1375, 8, 3)), 8974);

    expect(
      Jalali(1400, 2, 30, 1, 2, 3, 4).distanceFrom(
        Jalali(1375, 8, 3, 1, 2, 3, 4),
      ),
      8974,
    );
  });

  test('Gregorian.distanceFrom', () {
    expect(Gregorian(2021, 5, 20).distanceFrom(Gregorian(1996, 10, 24)), 8974);

    expect(
      Gregorian(2021, 5, 20, 1, 2, 3, 4).distanceFrom(
        Gregorian(1996, 10, 24, 1, 2, 3, 4),
      ),
      8974,
    );
  });

  test('Jalali.distanceFrom', () {
    expect(Jalali(1400, 2, 30).distanceTo(Jalali(1375, 8, 3)), -8974);

    expect(
      Jalali(1400, 2, 30, 1, 2, 3, 4).distanceTo(
        Jalali(1375, 8, 3, 1, 2, 3, 4),
      ),
      -8974,
    );
  });

  test('Gregorian.distanceFrom', () {
    expect(Gregorian(2021, 5, 20).distanceTo(Gregorian(1996, 10, 24)), -8974);

    expect(
      Gregorian(2021, 5, 20, 1, 2, 3, 4).distanceTo(
        Gregorian(1996, 10, 24, 1, 2, 3, 4),
      ),
      -8974,
    );
  });

  test('Jalali.time', () {
    final date = Jalali(1400, 2, 30, 1, 2, 3, 4);
    final time = date.time;

    expect(
      time.inMilliseconds,
      1 * 60 * 60 * 1000 + 2 * 60 * 1000 + 3 * 1000 + 4,
    );
  });

  test('Gregorian.time', () {
    final date = Gregorian(2000, 5, 5, 1, 2, 3, 4);
    final time = date.time;

    expect(
      time.inMilliseconds,
      1 * 60 * 60 * 1000 + 2 * 60 * 1000 + 3 * 1000 + 4,
    );
  });

  test('Jalali.fromMilliseconds', () {
    const int millis = 1722319497219;
    final timezone = DateTime.now().timeZoneOffset;
    final jdt = Jalali.fromMillisecondsSinceEpoch(
      millis - timezone.inMilliseconds, // defusing timezone.
    );
    expect(jdt.year, 1403);
    expect(jdt.month, 5);
    expect(jdt.day, 9);
    expect(jdt.hour, 6);
    expect(jdt.minute, 4);
    expect(jdt.second, 57);
    expect(jdt.millisecond, 219);
  });

  test('Gregorian.fromMilliseconds', () {
    const int millis = 1722319497219;
    final timezone = DateTime.now().timeZoneOffset;
    final gdt = Gregorian.fromMillisecondsSinceEpoch(
      millis - timezone.inMilliseconds, // defusing timezone.
    );
    expect(gdt.year, 2024);
    expect(gdt.month, 7);
    expect(gdt.day, 30);
    expect(gdt.hour, 6);
    expect(gdt.minute, 4);
    expect(gdt.second, 57);
    expect(gdt.millisecond, 219);
  });

  test('Jalali.fromMilliseconds( isUtc = true )', () {
    const int millis = 1722319497219;
    final jdt = Jalali.fromMillisecondsSinceEpoch(
      millis,
      isUtc: true,
    );
    expect(jdt.year, 1403);
    expect(jdt.month, 5);
    expect(jdt.day, 9);
    expect(jdt.hour, 6);
    expect(jdt.minute, 4);
    expect(jdt.second, 57);
    expect(jdt.millisecond, 219);
  });

  test('Gregorian.fromMilliseconds( isUtc = true )', () {
    const int millis = 1722319497219;
    final gdt = Gregorian.fromMillisecondsSinceEpoch(
      millis,
      isUtc: true,
    );
    expect(gdt.year, 2024);
    expect(gdt.month, 7);
    expect(gdt.day, 30);
    expect(gdt.hour, 6);
    expect(gdt.minute, 4);
    expect(gdt.second, 57);
    expect(gdt.millisecond, 219);
  });

  test('Iranian Calendar Authority Test Cases', () {
    // Persian leap year data provided by the Iranian calendar authority at:
    // https://calendar.ut.ac.ir/Fa/News/Data/Doc/KabiseShamsi1206-1498-new.pdf

    expect(Gregorian(1827, 3, 22), Jalali(1206));
    expect(false, Jalali(1206).isLeapYear());

    expect(Gregorian(1828, 3, 21), Jalali(1207));
    expect(false, Jalali(1207).isLeapYear());

    expect(Gregorian(1829, 3, 21), Jalali(1208));
    expect(false, Jalali(1208).isLeapYear());

    expect(Gregorian(1830, 3, 21), Jalali(1209));
    expect(false, Jalali(1209).isLeapYear());

    expect(Gregorian(1831, 3, 21), Jalali(1210));
    expect(true, Jalali(1210).isLeapYear());

    expect(Gregorian(1832, 3, 21), Jalali(1211));
    expect(false, Jalali(1211).isLeapYear());

    expect(Gregorian(1833, 3, 21), Jalali(1212));
    expect(false, Jalali(1212).isLeapYear());

    expect(Gregorian(1834, 3, 21), Jalali(1213));
    expect(false, Jalali(1213).isLeapYear());

    expect(Gregorian(1835, 3, 21), Jalali(1214));
    expect(true, Jalali(1214).isLeapYear());

    expect(Gregorian(1836, 3, 21), Jalali(1215));
    expect(false, Jalali(1215).isLeapYear());

    expect(Gregorian(1837, 3, 21), Jalali(1216));
    expect(false, Jalali(1216).isLeapYear());

    expect(Gregorian(1838, 3, 21), Jalali(1217));
    expect(false, Jalali(1217).isLeapYear());

    expect(Gregorian(1839, 3, 21), Jalali(1218));
    expect(true, Jalali(1218).isLeapYear());

    expect(Gregorian(1840, 3, 21), Jalali(1219));
    expect(false, Jalali(1219).isLeapYear());

    expect(Gregorian(1841, 3, 21), Jalali(1220));
    expect(false, Jalali(1220).isLeapYear());

    expect(Gregorian(1842, 3, 21), Jalali(1221));
    expect(false, Jalali(1221).isLeapYear());

    expect(Gregorian(1843, 3, 21), Jalali(1222));
    expect(true, Jalali(1222).isLeapYear());

    expect(Gregorian(1844, 3, 21), Jalali(1223));
    expect(false, Jalali(1223).isLeapYear());

    expect(Gregorian(1845, 3, 21), Jalali(1224));
    expect(false, Jalali(1224).isLeapYear());

    expect(Gregorian(1846, 3, 21), Jalali(1225));
    expect(false, Jalali(1225).isLeapYear());

    expect(Gregorian(1847, 3, 21), Jalali(1226));
    expect(true, Jalali(1226).isLeapYear());

    expect(Gregorian(1848, 3, 21), Jalali(1227));
    expect(false, Jalali(1227).isLeapYear());

    expect(Gregorian(1849, 3, 21), Jalali(1228));
    expect(false, Jalali(1228).isLeapYear());

    expect(Gregorian(1850, 3, 21), Jalali(1229));
    expect(false, Jalali(1229).isLeapYear());

    expect(Gregorian(1851, 3, 21), Jalali(1230));
    expect(true, Jalali(1230).isLeapYear());

    expect(Gregorian(1852, 3, 21), Jalali(1231));
    expect(false, Jalali(1231).isLeapYear());

    expect(Gregorian(1853, 3, 21), Jalali(1232));
    expect(false, Jalali(1232).isLeapYear());

    expect(Gregorian(1854, 3, 21), Jalali(1233));
    expect(false, Jalali(1233).isLeapYear());

    expect(Gregorian(1855, 3, 21), Jalali(1234));
    expect(true, Jalali(1234).isLeapYear());

    expect(Gregorian(1856, 3, 21), Jalali(1235));
    expect(false, Jalali(1235).isLeapYear());

    expect(Gregorian(1857, 3, 21), Jalali(1236));
    expect(false, Jalali(1236).isLeapYear());

    expect(Gregorian(1858, 3, 21), Jalali(1237));
    expect(false, Jalali(1237).isLeapYear());

    expect(Gregorian(1859, 3, 21), Jalali(1238));
    expect(true, Jalali(1238).isLeapYear());

    expect(Gregorian(1860, 3, 21), Jalali(1239));
    expect(false, Jalali(1239).isLeapYear());

    expect(Gregorian(1861, 3, 21), Jalali(1240));
    expect(false, Jalali(1240).isLeapYear());

    expect(Gregorian(1862, 3, 21), Jalali(1241));
    expect(false, Jalali(1241).isLeapYear());

    expect(Gregorian(1863, 3, 21), Jalali(1242));
    expect(false, Jalali(1242).isLeapYear());

    expect(Gregorian(1864, 3, 20), Jalali(1243));
    expect(true, Jalali(1243).isLeapYear());

    expect(Gregorian(1865, 3, 21), Jalali(1244));
    expect(false, Jalali(1244).isLeapYear());

    expect(Gregorian(1866, 3, 21), Jalali(1245));
    expect(false, Jalali(1245).isLeapYear());

    expect(Gregorian(1867, 3, 21), Jalali(1246));
    expect(false, Jalali(1246).isLeapYear());

    expect(Gregorian(1868, 3, 20), Jalali(1247));
    expect(true, Jalali(1247).isLeapYear());

    expect(Gregorian(1869, 3, 21), Jalali(1248));
    expect(false, Jalali(1248).isLeapYear());

    expect(Gregorian(1870, 3, 21), Jalali(1249));
    expect(false, Jalali(1249).isLeapYear());

    expect(Gregorian(1871, 3, 21), Jalali(1250));
    expect(false, Jalali(1250).isLeapYear());

    expect(Gregorian(1872, 3, 20), Jalali(1251));
    expect(true, Jalali(1251).isLeapYear());

    expect(Gregorian(1873, 3, 21), Jalali(1252));
    expect(false, Jalali(1252).isLeapYear());

    expect(Gregorian(1874, 3, 21), Jalali(1253));
    expect(false, Jalali(1253).isLeapYear());

    expect(Gregorian(1875, 3, 21), Jalali(1254));
    expect(false, Jalali(1254).isLeapYear());

    expect(Gregorian(1876, 3, 20), Jalali(1255));
    expect(true, Jalali(1255).isLeapYear());

    expect(Gregorian(1877, 3, 21), Jalali(1256));
    expect(false, Jalali(1256).isLeapYear());

    expect(Gregorian(1878, 3, 21), Jalali(1257));
    expect(false, Jalali(1257).isLeapYear());

    expect(Gregorian(1879, 3, 21), Jalali(1258));
    expect(false, Jalali(1258).isLeapYear());

    expect(Gregorian(1880, 3, 20), Jalali(1259));
    expect(true, Jalali(1259).isLeapYear());

    expect(Gregorian(1881, 3, 21), Jalali(1260));
    expect(false, Jalali(1260).isLeapYear());

    expect(Gregorian(1882, 3, 21), Jalali(1261));
    expect(false, Jalali(1261).isLeapYear());

    expect(Gregorian(1883, 3, 21), Jalali(1262));
    expect(false, Jalali(1262).isLeapYear());

    expect(Gregorian(1884, 3, 20), Jalali(1263));
    expect(true, Jalali(1263).isLeapYear());

    expect(Gregorian(1885, 3, 21), Jalali(1264));
    expect(false, Jalali(1264).isLeapYear());

    expect(Gregorian(1886, 3, 21), Jalali(1265));
    expect(false, Jalali(1265).isLeapYear());

    expect(Gregorian(1887, 3, 21), Jalali(1266));
    expect(false, Jalali(1266).isLeapYear());

    expect(Gregorian(1888, 3, 20), Jalali(1267));
    expect(true, Jalali(1267).isLeapYear());

    expect(Gregorian(1889, 3, 21), Jalali(1268));
    expect(false, Jalali(1268).isLeapYear());

    expect(Gregorian(1890, 3, 21), Jalali(1269));
    expect(false, Jalali(1269).isLeapYear());

    expect(Gregorian(1891, 3, 21), Jalali(1270));
    expect(false, Jalali(1270).isLeapYear());

    expect(Gregorian(1892, 3, 20), Jalali(1271));
    expect(true, Jalali(1271).isLeapYear());

    expect(Gregorian(1893, 3, 21), Jalali(1272));
    expect(false, Jalali(1272).isLeapYear());

    expect(Gregorian(1894, 3, 21), Jalali(1273));
    expect(false, Jalali(1273).isLeapYear());

    expect(Gregorian(1895, 3, 21), Jalali(1274));
    expect(false, Jalali(1274).isLeapYear());

    expect(Gregorian(1896, 3, 20), Jalali(1275));
    expect(false, Jalali(1275).isLeapYear());

    expect(Gregorian(1897, 3, 20), Jalali(1276));
    expect(true, Jalali(1276).isLeapYear());

    expect(Gregorian(1898, 3, 21), Jalali(1277));
    expect(false, Jalali(1277).isLeapYear());

    expect(Gregorian(1899, 3, 21), Jalali(1278));
    expect(false, Jalali(1278).isLeapYear());

    expect(Gregorian(1900, 3, 21), Jalali(1279));
    expect(false, Jalali(1279).isLeapYear());

    expect(Gregorian(1901, 3, 21), Jalali(1280));
    expect(true, Jalali(1280).isLeapYear());

    expect(Gregorian(1902, 3, 22), Jalali(1281));
    expect(false, Jalali(1281).isLeapYear());

    expect(Gregorian(1903, 3, 22), Jalali(1282));
    expect(false, Jalali(1282).isLeapYear());

    expect(Gregorian(1904, 3, 21), Jalali(1283));
    expect(false, Jalali(1283).isLeapYear());

    expect(Gregorian(1905, 3, 21), Jalali(1284));
    expect(true, Jalali(1284).isLeapYear());

    expect(Gregorian(1906, 3, 22), Jalali(1285));
    expect(false, Jalali(1285).isLeapYear());

    expect(Gregorian(1907, 3, 22), Jalali(1286));
    expect(false, Jalali(1286).isLeapYear());

    expect(Gregorian(1908, 3, 21), Jalali(1287));
    expect(false, Jalali(1287).isLeapYear());

    expect(Gregorian(1909, 3, 21), Jalali(1288));
    expect(true, Jalali(1288).isLeapYear());

    expect(Gregorian(1910, 3, 22), Jalali(1289));
    expect(false, Jalali(1289).isLeapYear());

    expect(Gregorian(1911, 3, 22), Jalali(1290));
    expect(false, Jalali(1290).isLeapYear());

    expect(Gregorian(1912, 3, 21), Jalali(1291));
    expect(false, Jalali(1291).isLeapYear());

    expect(Gregorian(1913, 3, 21), Jalali(1292));
    expect(true, Jalali(1292).isLeapYear());

    expect(Gregorian(1914, 3, 22), Jalali(1293));
    expect(false, Jalali(1293).isLeapYear());

    expect(Gregorian(1915, 3, 22), Jalali(1294));
    expect(false, Jalali(1294).isLeapYear());

    expect(Gregorian(1916, 3, 21), Jalali(1295));
    expect(false, Jalali(1295).isLeapYear());

    expect(Gregorian(1917, 3, 21), Jalali(1296));
    expect(true, Jalali(1296).isLeapYear());

    expect(Gregorian(1918, 3, 22), Jalali(1297));
    expect(false, Jalali(1297).isLeapYear());

    expect(Gregorian(1919, 3, 22), Jalali(1298));
    expect(false, Jalali(1298).isLeapYear());

    expect(Gregorian(1920, 3, 21), Jalali(1299));
    expect(false, Jalali(1299).isLeapYear());

    expect(Gregorian(1921, 3, 21), Jalali(1300));
    expect(true, Jalali(1300).isLeapYear());

    expect(Gregorian(1922, 3, 22), Jalali(1301));
    expect(false, Jalali(1301).isLeapYear());

    expect(Gregorian(1923, 3, 22), Jalali(1302));
    expect(false, Jalali(1302).isLeapYear());

    expect(Gregorian(1924, 3, 21), Jalali(1303));
    expect(false, Jalali(1303).isLeapYear());

    expect(Gregorian(1925, 3, 21), Jalali(1304));
    expect(true, Jalali(1304).isLeapYear());

    expect(Gregorian(1926, 3, 22), Jalali(1305));
    expect(false, Jalali(1305).isLeapYear());

    expect(Gregorian(1927, 3, 22), Jalali(1306));
    expect(false, Jalali(1306).isLeapYear());

    expect(Gregorian(1928, 3, 21), Jalali(1307));
    expect(false, Jalali(1307).isLeapYear());

    expect(Gregorian(1929, 3, 21), Jalali(1308));
    expect(false, Jalali(1308).isLeapYear());

    expect(Gregorian(1930, 3, 21), Jalali(1309));
    expect(true, Jalali(1309).isLeapYear());

    expect(Gregorian(1931, 3, 22), Jalali(1310));
    expect(false, Jalali(1310).isLeapYear());

    expect(Gregorian(1932, 3, 21), Jalali(1311));
    expect(false, Jalali(1311).isLeapYear());

    expect(Gregorian(1933, 3, 21), Jalali(1312));
    expect(false, Jalali(1312).isLeapYear());

    expect(Gregorian(1934, 3, 21), Jalali(1313));
    expect(true, Jalali(1313).isLeapYear());

    expect(Gregorian(1935, 3, 22), Jalali(1314));
    expect(false, Jalali(1314).isLeapYear());

    expect(Gregorian(1936, 3, 21), Jalali(1315));
    expect(false, Jalali(1315).isLeapYear());

    expect(Gregorian(1937, 3, 21), Jalali(1316));
    expect(false, Jalali(1316).isLeapYear());

    expect(Gregorian(1938, 3, 21), Jalali(1317));
    expect(true, Jalali(1317).isLeapYear());

    expect(Gregorian(1939, 3, 22), Jalali(1318));
    expect(false, Jalali(1318).isLeapYear());

    expect(Gregorian(1940, 3, 21), Jalali(1319));
    expect(false, Jalali(1319).isLeapYear());

    expect(Gregorian(1941, 3, 21), Jalali(1320));
    expect(false, Jalali(1320).isLeapYear());

    expect(Gregorian(1942, 3, 21), Jalali(1321));
    expect(true, Jalali(1321).isLeapYear());

    expect(Gregorian(1943, 3, 22), Jalali(1322));
    expect(false, Jalali(1322).isLeapYear());

    expect(Gregorian(1944, 3, 21), Jalali(1323));
    expect(false, Jalali(1323).isLeapYear());

    expect(Gregorian(1945, 3, 21), Jalali(1324));
    expect(false, Jalali(1324).isLeapYear());

    expect(Gregorian(1946, 3, 21), Jalali(1325));
    expect(true, Jalali(1325).isLeapYear());

    expect(Gregorian(1947, 3, 22), Jalali(1326));
    expect(false, Jalali(1326).isLeapYear());

    expect(Gregorian(1948, 3, 21), Jalali(1327));
    expect(false, Jalali(1327).isLeapYear());

    expect(Gregorian(1949, 3, 21), Jalali(1328));
    expect(false, Jalali(1328).isLeapYear());

    expect(Gregorian(1950, 3, 21), Jalali(1329));
    expect(true, Jalali(1329).isLeapYear());

    expect(Gregorian(1951, 3, 22), Jalali(1330));
    expect(false, Jalali(1330).isLeapYear());

    expect(Gregorian(1952, 3, 21), Jalali(1331));
    expect(false, Jalali(1331).isLeapYear());

    expect(Gregorian(1953, 3, 21), Jalali(1332));
    expect(false, Jalali(1332).isLeapYear());

    expect(Gregorian(1954, 3, 21), Jalali(1333));
    expect(true, Jalali(1333).isLeapYear());

    expect(Gregorian(1955, 3, 22), Jalali(1334));
    expect(false, Jalali(1334).isLeapYear());

    expect(Gregorian(1956, 3, 21), Jalali(1335));
    expect(false, Jalali(1335).isLeapYear());

    expect(Gregorian(1957, 3, 21), Jalali(1336));
    expect(false, Jalali(1336).isLeapYear());

    expect(Gregorian(1958, 3, 21), Jalali(1337));
    expect(true, Jalali(1337).isLeapYear());

    expect(Gregorian(1959, 3, 22), Jalali(1338));
    expect(false, Jalali(1338).isLeapYear());

    expect(Gregorian(1960, 3, 21), Jalali(1339));
    expect(false, Jalali(1339).isLeapYear());

    expect(Gregorian(1961, 3, 21), Jalali(1340));
    expect(false, Jalali(1340).isLeapYear());

    expect(Gregorian(1962, 3, 21), Jalali(1341));
    expect(false, Jalali(1341).isLeapYear());

    expect(Gregorian(1963, 3, 21), Jalali(1342));
    expect(true, Jalali(1342).isLeapYear());

    expect(Gregorian(1964, 3, 21), Jalali(1343));
    expect(false, Jalali(1343).isLeapYear());

    expect(Gregorian(1965, 3, 21), Jalali(1344));
    expect(false, Jalali(1344).isLeapYear());

    expect(Gregorian(1966, 3, 21), Jalali(1345));
    expect(false, Jalali(1345).isLeapYear());

    expect(Gregorian(1967, 3, 21), Jalali(1346));
    expect(true, Jalali(1346).isLeapYear());

    expect(Gregorian(1968, 3, 21), Jalali(1347));
    expect(false, Jalali(1347).isLeapYear());

    expect(Gregorian(1969, 3, 21), Jalali(1348));
    expect(false, Jalali(1348).isLeapYear());

    expect(Gregorian(1970, 3, 21), Jalali(1349));
    expect(false, Jalali(1349).isLeapYear());

    expect(Gregorian(1971, 3, 21), Jalali(1350));
    expect(true, Jalali(1350).isLeapYear());

    expect(Gregorian(1972, 3, 21), Jalali(1351));
    expect(false, Jalali(1351).isLeapYear());

    expect(Gregorian(1973, 3, 21), Jalali(1352));
    expect(false, Jalali(1352).isLeapYear());

    expect(Gregorian(1974, 3, 21), Jalali(1353));
    expect(false, Jalali(1353).isLeapYear());

    expect(Gregorian(1975, 3, 21), Jalali(1354));
    expect(true, Jalali(1354).isLeapYear());

    expect(Gregorian(1976, 3, 21), Jalali(1355));
    expect(false, Jalali(1355).isLeapYear());

    expect(Gregorian(1977, 3, 21), Jalali(1356));
    expect(false, Jalali(1356).isLeapYear());

    expect(Gregorian(1978, 3, 21), Jalali(1357));
    expect(false, Jalali(1357).isLeapYear());

    expect(Gregorian(1979, 3, 21), Jalali(1358));
    expect(true, Jalali(1358).isLeapYear());

    expect(Gregorian(1980, 3, 21), Jalali(1359));
    expect(false, Jalali(1359).isLeapYear());

    expect(Gregorian(1981, 3, 21), Jalali(1360));
    expect(false, Jalali(1360).isLeapYear());

    expect(Gregorian(1982, 3, 21), Jalali(1361));
    expect(false, Jalali(1361).isLeapYear());

    expect(Gregorian(1983, 3, 21), Jalali(1362));
    expect(true, Jalali(1362).isLeapYear());

    expect(Gregorian(1984, 3, 21), Jalali(1363));
    expect(false, Jalali(1363).isLeapYear());

    expect(Gregorian(1985, 3, 21), Jalali(1364));
    expect(false, Jalali(1364).isLeapYear());

    expect(Gregorian(1986, 3, 21), Jalali(1365));
    expect(false, Jalali(1365).isLeapYear());

    expect(Gregorian(1987, 3, 21), Jalali(1366));
    expect(true, Jalali(1366).isLeapYear());

    expect(Gregorian(1988, 3, 21), Jalali(1367));
    expect(false, Jalali(1367).isLeapYear());

    expect(Gregorian(1989, 3, 21), Jalali(1368));
    expect(false, Jalali(1368).isLeapYear());

    expect(Gregorian(1990, 3, 21), Jalali(1369));
    expect(false, Jalali(1369).isLeapYear());

    expect(Gregorian(1991, 3, 21), Jalali(1370));
    expect(true, Jalali(1370).isLeapYear());

    expect(Gregorian(1992, 3, 21), Jalali(1371));
    expect(false, Jalali(1371).isLeapYear());

    expect(Gregorian(1993, 3, 21), Jalali(1372));
    expect(false, Jalali(1372).isLeapYear());

    expect(Gregorian(1994, 3, 21), Jalali(1373));
    expect(false, Jalali(1373).isLeapYear());

    expect(Gregorian(1995, 3, 21), Jalali(1374));
    expect(false, Jalali(1374).isLeapYear());

    expect(Gregorian(1996, 3, 20), Jalali(1375));
    expect(true, Jalali(1375).isLeapYear());

    expect(Gregorian(1997, 3, 21), Jalali(1376));
    expect(false, Jalali(1376).isLeapYear());

    expect(Gregorian(1998, 3, 21), Jalali(1377));
    expect(false, Jalali(1377).isLeapYear());

    expect(Gregorian(1999, 3, 21), Jalali(1378));
    expect(false, Jalali(1378).isLeapYear());

    expect(Gregorian(2000, 3, 20), Jalali(1379));
    expect(true, Jalali(1379).isLeapYear());

    expect(Gregorian(2001, 3, 21), Jalali(1380));
    expect(false, Jalali(1380).isLeapYear());

    expect(Gregorian(2002, 3, 21), Jalali(1381));
    expect(false, Jalali(1381).isLeapYear());

    expect(Gregorian(2003, 3, 21), Jalali(1382));
    expect(false, Jalali(1382).isLeapYear());

    expect(Gregorian(2004, 3, 20), Jalali(1383));
    expect(true, Jalali(1383).isLeapYear());

    expect(Gregorian(2005, 3, 21), Jalali(1384));
    expect(false, Jalali(1384).isLeapYear());

    expect(Gregorian(2006, 3, 21), Jalali(1385));
    expect(false, Jalali(1385).isLeapYear());

    expect(Gregorian(2007, 3, 21), Jalali(1386));
    expect(false, Jalali(1386).isLeapYear());

    expect(Gregorian(2008, 3, 20), Jalali(1387));
    expect(true, Jalali(1387).isLeapYear());

    expect(Gregorian(2009, 3, 21), Jalali(1388));
    expect(false, Jalali(1388).isLeapYear());

    expect(Gregorian(2010, 3, 21), Jalali(1389));
    expect(false, Jalali(1389).isLeapYear());

    expect(Gregorian(2011, 3, 21), Jalali(1390));
    expect(false, Jalali(1390).isLeapYear());

    expect(Gregorian(2012, 3, 20), Jalali(1391));
    expect(true, Jalali(1391).isLeapYear());

    expect(Gregorian(2013, 3, 21), Jalali(1392));
    expect(false, Jalali(1392).isLeapYear());

    expect(Gregorian(2014, 3, 21), Jalali(1393));
    expect(false, Jalali(1393).isLeapYear());

    expect(Gregorian(2015, 3, 21), Jalali(1394));
    expect(false, Jalali(1394).isLeapYear());

    expect(Gregorian(2016, 3, 20), Jalali(1395));
    expect(true, Jalali(1395).isLeapYear());

    expect(Gregorian(2017, 3, 21), Jalali(1396));
    expect(false, Jalali(1396).isLeapYear());

    expect(Gregorian(2018, 3, 21), Jalali(1397));
    expect(false, Jalali(1397).isLeapYear());

    expect(Gregorian(2019, 3, 21), Jalali(1398));
    expect(false, Jalali(1398).isLeapYear());

    expect(Gregorian(2020, 3, 20), Jalali(1399));
    expect(true, Jalali(1399).isLeapYear());

    expect(Gregorian(2021, 3, 21), Jalali(1400));
    expect(false, Jalali(1400).isLeapYear());

    expect(Gregorian(2022, 3, 21), Jalali(1401));
    expect(false, Jalali(1401).isLeapYear());

    expect(Gregorian(2023, 3, 21), Jalali(1402));
    expect(false, Jalali(1402).isLeapYear());

    expect(Gregorian(2024, 3, 20), Jalali(1403));
    expect(true, Jalali(1403).isLeapYear());

    expect(Gregorian(2025, 3, 21), Jalali(1404));
    expect(false, Jalali(1404).isLeapYear());

    expect(Gregorian(2026, 3, 21), Jalali(1405));
    expect(false, Jalali(1405).isLeapYear());

    expect(Gregorian(2027, 3, 21), Jalali(1406));
    expect(false, Jalali(1406).isLeapYear());

    expect(Gregorian(2028, 3, 20), Jalali(1407));
    expect(false, Jalali(1407).isLeapYear());

    expect(Gregorian(2029, 3, 20), Jalali(1408));
    expect(true, Jalali(1408).isLeapYear());

    expect(Gregorian(2030, 3, 21), Jalali(1409));
    expect(false, Jalali(1409).isLeapYear());

    expect(Gregorian(2031, 3, 21), Jalali(1410));
    expect(false, Jalali(1410).isLeapYear());

    expect(Gregorian(2032, 3, 20), Jalali(1411));
    expect(false, Jalali(1411).isLeapYear());

    expect(Gregorian(2033, 3, 20), Jalali(1412));
    expect(true, Jalali(1412).isLeapYear());

    expect(Gregorian(2034, 3, 21), Jalali(1413));
    expect(false, Jalali(1413).isLeapYear());

    expect(Gregorian(2035, 3, 21), Jalali(1414));
    expect(false, Jalali(1414).isLeapYear());

    expect(Gregorian(2036, 3, 20), Jalali(1415));
    expect(false, Jalali(1415).isLeapYear());

    expect(Gregorian(2037, 3, 20), Jalali(1416));
    expect(true, Jalali(1416).isLeapYear());

    expect(Gregorian(2038, 3, 21), Jalali(1417));
    expect(false, Jalali(1417).isLeapYear());

    expect(Gregorian(2039, 3, 21), Jalali(1418));
    expect(false, Jalali(1418).isLeapYear());

    expect(Gregorian(2040, 3, 20), Jalali(1419));
    expect(false, Jalali(1419).isLeapYear());

    expect(Gregorian(2041, 3, 20), Jalali(1420));
    expect(true, Jalali(1420).isLeapYear());

    expect(Gregorian(2042, 3, 21), Jalali(1421));
    expect(false, Jalali(1421).isLeapYear());

    expect(Gregorian(2043, 3, 21), Jalali(1422));
    expect(false, Jalali(1422).isLeapYear());

    expect(Gregorian(2044, 3, 20), Jalali(1423));
    expect(false, Jalali(1423).isLeapYear());

    expect(Gregorian(2045, 3, 20), Jalali(1424));
    expect(true, Jalali(1424).isLeapYear());

    expect(Gregorian(2046, 3, 21), Jalali(1425));
    expect(false, Jalali(1425).isLeapYear());

    expect(Gregorian(2047, 3, 21), Jalali(1426));
    expect(false, Jalali(1426).isLeapYear());

    expect(Gregorian(2048, 3, 20), Jalali(1427));
    expect(false, Jalali(1427).isLeapYear());

    expect(Gregorian(2049, 3, 20), Jalali(1428));
    expect(true, Jalali(1428).isLeapYear());

    expect(Gregorian(2050, 3, 21), Jalali(1429));
    expect(false, Jalali(1429).isLeapYear());

    expect(Gregorian(2051, 3, 21), Jalali(1430));
    expect(false, Jalali(1430).isLeapYear());

    expect(Gregorian(2052, 3, 20), Jalali(1431));
    expect(false, Jalali(1431).isLeapYear());

    expect(Gregorian(2053, 3, 20), Jalali(1432));
    expect(true, Jalali(1432).isLeapYear());

    expect(Gregorian(2054, 3, 21), Jalali(1433));
    expect(false, Jalali(1433).isLeapYear());

    expect(Gregorian(2055, 3, 21), Jalali(1434));
    expect(false, Jalali(1434).isLeapYear());

    expect(Gregorian(2056, 3, 20), Jalali(1435));
    expect(false, Jalali(1435).isLeapYear());

    expect(Gregorian(2057, 3, 20), Jalali(1436));
    expect(true, Jalali(1436).isLeapYear());

    expect(Gregorian(2058, 3, 21), Jalali(1437));
    expect(false, Jalali(1437).isLeapYear());

    expect(Gregorian(2059, 3, 21), Jalali(1438));
    expect(false, Jalali(1438).isLeapYear());

    expect(Gregorian(2060, 3, 20), Jalali(1439));
    expect(false, Jalali(1439).isLeapYear());

    expect(Gregorian(2061, 3, 20), Jalali(1440));
    expect(false, Jalali(1440).isLeapYear());

    expect(Gregorian(2062, 3, 20), Jalali(1441));
    expect(true, Jalali(1441).isLeapYear());

    expect(Gregorian(2063, 3, 21), Jalali(1442));
    expect(false, Jalali(1442).isLeapYear());

    expect(Gregorian(2064, 3, 20), Jalali(1443));
    expect(false, Jalali(1443).isLeapYear());

    expect(Gregorian(2065, 3, 20), Jalali(1444));
    expect(false, Jalali(1444).isLeapYear());

    expect(Gregorian(2066, 3, 20), Jalali(1445));
    expect(true, Jalali(1445).isLeapYear());

    expect(Gregorian(2067, 3, 21), Jalali(1446));
    expect(false, Jalali(1446).isLeapYear());

    expect(Gregorian(2068, 3, 20), Jalali(1447));
    expect(false, Jalali(1447).isLeapYear());

    expect(Gregorian(2069, 3, 20), Jalali(1448));
    expect(false, Jalali(1448).isLeapYear());

    expect(Gregorian(2070, 3, 20), Jalali(1449));
    expect(true, Jalali(1449).isLeapYear());

    expect(Gregorian(2071, 3, 21), Jalali(1450));
    expect(false, Jalali(1450).isLeapYear());

    expect(Gregorian(2072, 3, 20), Jalali(1451));
    expect(false, Jalali(1451).isLeapYear());

    expect(Gregorian(2073, 3, 20), Jalali(1452));
    expect(false, Jalali(1452).isLeapYear());

    expect(Gregorian(2074, 3, 20), Jalali(1453));
    expect(true, Jalali(1453).isLeapYear());

    expect(Gregorian(2075, 3, 21), Jalali(1454));
    expect(false, Jalali(1454).isLeapYear());

    expect(Gregorian(2076, 3, 20), Jalali(1455));
    expect(false, Jalali(1455).isLeapYear());

    expect(Gregorian(2077, 3, 20), Jalali(1456));
    expect(false, Jalali(1456).isLeapYear());

    expect(Gregorian(2078, 3, 20), Jalali(1457));
    expect(true, Jalali(1457).isLeapYear());

    expect(Gregorian(2079, 3, 21), Jalali(1458));
    expect(false, Jalali(1458).isLeapYear());

    expect(Gregorian(2080, 3, 20), Jalali(1459));
    expect(false, Jalali(1459).isLeapYear());

    expect(Gregorian(2081, 3, 20), Jalali(1460));
    expect(false, Jalali(1460).isLeapYear());

    expect(Gregorian(2082, 3, 20), Jalali(1461));
    expect(true, Jalali(1461).isLeapYear());

    expect(Gregorian(2083, 3, 21), Jalali(1462));
    expect(false, Jalali(1462).isLeapYear());

    expect(Gregorian(2084, 3, 20), Jalali(1463));
    expect(false, Jalali(1463).isLeapYear());

    expect(Gregorian(2085, 3, 20), Jalali(1464));
    expect(false, Jalali(1464).isLeapYear());

    expect(Gregorian(2086, 3, 20), Jalali(1465));
    expect(true, Jalali(1465).isLeapYear());

    expect(Gregorian(2087, 3, 21), Jalali(1466));
    expect(false, Jalali(1466).isLeapYear());

    expect(Gregorian(2088, 3, 20), Jalali(1467));
    expect(false, Jalali(1467).isLeapYear());

    expect(Gregorian(2089, 3, 20), Jalali(1468));
    expect(false, Jalali(1468).isLeapYear());

    expect(Gregorian(2090, 3, 20), Jalali(1469));
    expect(true, Jalali(1469).isLeapYear());

    expect(Gregorian(2091, 3, 21), Jalali(1470));
    expect(false, Jalali(1470).isLeapYear());

    expect(Gregorian(2092, 3, 20), Jalali(1471));
    expect(false, Jalali(1471).isLeapYear());

    expect(Gregorian(2093, 3, 20), Jalali(1472));
    expect(false, Jalali(1472).isLeapYear());

    expect(Gregorian(2094, 3, 20), Jalali(1473));
    expect(false, Jalali(1473).isLeapYear());

    expect(Gregorian(2095, 3, 20), Jalali(1474));
    expect(true, Jalali(1474).isLeapYear());

    expect(Gregorian(2096, 3, 20), Jalali(1475));
    expect(false, Jalali(1475).isLeapYear());

    expect(Gregorian(2097, 3, 20), Jalali(1476));
    expect(false, Jalali(1476).isLeapYear());

    expect(Gregorian(2098, 3, 20), Jalali(1477));
    expect(false, Jalali(1477).isLeapYear());

    expect(Gregorian(2099, 3, 20), Jalali(1478));
    expect(true, Jalali(1478).isLeapYear());

    expect(Gregorian(2100, 3, 21), Jalali(1479));
    expect(false, Jalali(1479).isLeapYear());

    expect(Gregorian(2101, 3, 21), Jalali(1480));
    expect(false, Jalali(1480).isLeapYear());

    expect(Gregorian(2102, 3, 21), Jalali(1481));
    expect(false, Jalali(1481).isLeapYear());

    expect(Gregorian(2103, 3, 21), Jalali(1482));
    expect(true, Jalali(1482).isLeapYear());

    expect(Gregorian(2104, 3, 21), Jalali(1483));
    expect(false, Jalali(1483).isLeapYear());

    expect(Gregorian(2105, 3, 21), Jalali(1484));
    expect(false, Jalali(1484).isLeapYear());

    expect(Gregorian(2106, 3, 21), Jalali(1485));
    expect(false, Jalali(1485).isLeapYear());

    expect(Gregorian(2107, 3, 21), Jalali(1486));
    expect(true, Jalali(1486).isLeapYear());

    expect(Gregorian(2108, 3, 21), Jalali(1487));
    expect(false, Jalali(1487).isLeapYear());

    expect(Gregorian(2109, 3, 21), Jalali(1488));
    expect(false, Jalali(1488).isLeapYear());

    expect(Gregorian(2110, 3, 21), Jalali(1489));
    expect(false, Jalali(1489).isLeapYear());

    expect(Gregorian(2111, 3, 21), Jalali(1490));
    expect(true, Jalali(1490).isLeapYear());

    expect(Gregorian(2112, 3, 21), Jalali(1491));
    expect(false, Jalali(1491).isLeapYear());

    expect(Gregorian(2113, 3, 21), Jalali(1492));
    expect(false, Jalali(1492).isLeapYear());

    expect(Gregorian(2114, 3, 21), Jalali(1493));
    expect(false, Jalali(1493).isLeapYear());

    expect(Gregorian(2115, 3, 21), Jalali(1494));
    expect(true, Jalali(1494).isLeapYear());

    expect(Gregorian(2116, 3, 21), Jalali(1495));
    expect(false, Jalali(1495).isLeapYear());

    expect(Gregorian(2117, 3, 21), Jalali(1496));
    expect(false, Jalali(1496).isLeapYear());

    expect(Gregorian(2118, 3, 21), Jalali(1497));
    expect(false, Jalali(1497).isLeapYear());

    expect(Gregorian(2119, 3, 21), Jalali(1498));
    expect(true, Jalali(1498).isLeapYear());
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
