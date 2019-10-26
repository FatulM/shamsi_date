# shamsi_date example

There is a complete example flutter application for shamsi_date package,
which shows today in both Jalali and Georgian.
Clone Github repository if you want to play with it.

Here is a quick start guide for shamsi_date package:

```dart
import 'package:shamsi_date/shamsi_date.dart';

main() {
  // Gregorian to Jalali conversion
  final Gregorian g1 = Gregorian(2013, 1, 10);
  final Jalali j1 = g1.toJalali();
  print('$g1 == $j1');
  // prints: Gregorian(2013,1,10) == Jalali(1391,10,21)
  // you can write Jalali.fromGregorian(g1) instead of g1.toJalali()

  // access year, month and day through getters
  // for Jalali:
  final int j1y = j1.year; // j1y = 1391
  final int j1m = j1.month; // j1m = 10
  final int j1d = j1.day; // j1d = 21
  // and for Gregorian:
  final int g1y = g1.year; // g1y = 2013
  final int g1m = g1.month; // g1m = 1
  final int g1d = g1.day; // g1d = 10

  // Jalali to Gregorian conversion
  final Jalali j2 = Jalali(1391, 10, 21);
  final Gregorian g2 = j1.toGregorian();
  print('$j2 == $g2');
  // prints: Jalali(1391,10,21) == Gregorian(2013,1,10)
  // also can use Gregorian.fromJalali(j1) instead of j1.toGregorian()

  // find weekDay
  print('$j1 has weekDay ${j1.weekDay}'); // -> 6
  print('$g1 has weekDay ${g1.weekDay}'); // -> 4

  // find month length
  print('Jalali 1390/12 month length? '
      '${Jalali(1390, 12).monthLength}'); // -> 29
  print('Gregorian 2000/2 month length? '
      '${Gregorian(2000, 2).monthLength}'); // -> 29

  // check leap year
  print('1390 Jalali is leap year? '
      '${Jalali(1390).isLeapYear()}'); // -> false
  print('2000 Gregorian is leap year? '
      '${Gregorian(2000).isLeapYear()}'); // -> true

  // check validity
  print('$j1 is valid? ${j1.isValid()}'); // -> true
  print('$g1 is valid? ${g1.isValid()}'); // -> true
  final jv = Jalali(1398, 13, 1); // not valid!
  print('$jv is valid? ${jv.isValid()}'); // -> false
  final gv = Gregorian(2000, 1, -10); // not valid!
  print('$gv is valid? ${gv.isValid()}'); // -> false

  // convert DateTime object to Jalali and Gregorian
  final dateTime = DateTime.now();
  print('now is $dateTime');
  print('now is ${Gregorian.fromDateTime(dateTime)} in Gregorian');
  print('now is ${Jalali.fromDateTime(dateTime)} in Jalali');
  // convert to DateTime
  print('$j1 is ${j1.toDateTime()}');
  print('$g1 is ${g1.toDateTime()}');

  // convert Jalali and Gregorian to DateTime
  print('$j1 as DateTime is ${j1.toDateTime()}');
  print('$g1 as DateTime is ${g1.toDateTime()}');

  // find today with now() factory method
  print('now is ${Gregorian.now()} in Gregorian');
  print('now is ${Jalali.now()} in Jalali');
  // find out which jalali year is this year:
  final int thisYear = Jalali.now().year;

  // copy method
  print('$j1 with year = 1300 is ${j1.copy(year: 1300)}');
  // prints: 1391/10/21 with year = 1300 is 1300/10/21
  print('$g1 with month = 1 and day = 2 is ${g1.copy(month: 1, day: 2)}');
  // prints: 2013/1/10 with month = 1 and day = 2 is 2013/1/2

  // for example for getting date at start of this month in Jalali:
  print(Jalali.now().copy(day: 1));
  // for example to find 3rd day of 2nd month of this year:
  print(Jalali.now().copy(month: 2, day: 3));
  // DON NOT do it like this:
  print(Jalali(Jalali.now().year, Jalali.now().month, 1)); // INCORRECT
  // for example if you want to get last day of the last month of this Jalali year:
  final tmp = Jalali.now().copy(month: 12, day: 1);
  // since we can be in a leap year we use monthLength:
  print(tmp.copy(day: tmp.monthLength));

  // add and subtract days
  final d1 = Jalali(1398, 8, 4);
  // add days
  print(d1 + 3); // -> 1398/8/7
  // result will be manipulated to become valid:
  print(d1 + 30); // -> 1398/9/4
  print(d1 + 365); // -> 1399/8/4
  // subtract days
  print(d1 - 2); // -> 1398/8/2
  // add years, months and days:
  print(d1.add(years: 1, months: 2, days: 3)); // 1399/10/7
  // add years and days only:
  print(d1.add(years: 1, days: 3)); // 1399/8/7
  // add months only:
  print(d1.add(months: 2)); // 1398/10/3
  // if you want to subtract you can add negative value:
  print(d1.add(years: -1)); // 1397/8/3
  // and also for Gregorian

  // formatting examples:

  // example one:
  String format1(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  }

  print(format1(j1)); // prints: پنج شنبه 21 دی 91
  print(format1(g1)); // prints: Thursday 10 January 13

  // example one:
  String format2(Date d) {
    final f = d.formatter;

    return '${f.dd}/${f.mm}/${f.yyyy}';
  }

  print(format2(j1)); // prints: 21/10/1391
  print(format2(g1)); // prints: 10/01/2013

  // DO NOT use formatter for accessing year, month or other properties
  // of date objects they are available as getters on date objects
  // INCORRECT EXAMPLE, DO NOT USE THIS:
  final int ty1 = int.parse(Jalali.now().formatter.yyyy); // INCORRECT
  // use this:
  final int ty2 = Jalali.now().year; // correct
  // also using toString() for showing dates on UI is not recommended,
  // use custom formatter.

  // comparing dates examples:
  print(j1 > j2); // -> false
  print(j1.compareTo(j2) > 0); // -> false
  print(j1 <= j2); // -> true
  print(j1.compareTo(j2) <= 0); // -> true
  print(g1 >= g2); // -> true
  print(g1.compareTo(g2)); // -> 0
  print(g1 == g2); // -> true
  print(g1 != g1); // -> false

  // if you want to compare Jalali with Georgian you can convert one type to another,
  // for example:
  print(j1.toGregorian() == g1); // -> true
  // but if you don't want to convert them you can use julianDayNumber
  // (this approach is not recommended)
  print(j1.julianDayNumber == g1.julianDayNumber); // -> true
  // this means that they are equal
  // you can also use other comparison operators
}
```