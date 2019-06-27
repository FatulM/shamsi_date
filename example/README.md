# shamsi_date example

There is a complete example flutter application for shamsi_date package,
which shows today in both Jalali and Georgian.
Clone Github repository if you want to play with it.

Here is a quick start guide for shamsi_date package:

```dart
import 'package:shamsi_date/shamsi_date.dart';

main() {
  // Gregorian to Jalali conversion
  final g1 = Gregorian(2013, 1, 10);
  final j1 = g1.toJalali();
  print('$g1 in Gregorian is $j1 in Jalali');
  // prints: 2013/1/10 in Gregorian is 1391/10/21 in Jalali
  // you can write Jalali.fromGregorian(g1) instead of g1.toJalali()

  // Jalali to Gregorian conversion
  final j2 = Jalali(1391, 10, 21);
  final g2 = j1.toGregorian();
  print('$j2 in Jalali is $g2  in Gregorian');
  // prints: 1391/10/21 in Jalali is 2013/1/10  in Gregorian
  // you can write Gregorian.fromJalali(j1) instead of j1.toGregorian()

  // check validity
  print('$j1 is valid? ${j1.isValid()}');
  // -> true

  // check leap year
  print('1390 is leap year? ${Jalali(1390).isLeapYear()}');
  // -> false

  // find month length
  print('1390/12 month length? ${Jalali(1390, 12).monthLength}');
  // -> 29

  // convert DateTime object to Jalali and Gregorian
  final dateTime = DateTime.now();
  print('now is $dateTime');
  print('now is ${Gregorian.fromDateTime(dateTime)} in Gregorian');
  print('now is ${Jalali.fromDateTime(dateTime)} in Jalali');

  // convert Jalali and Gregorian to DateTime
  print('$j1 as DateTime is ${j1.toDateTime()}');
  print('$g1 as DateTime is ${g1.toDateTime()}');

  // now() factory method
  print('now is ${Gregorian.now()} in Gregorian');
  print('now is ${Jalali.now()} in Jalali');

  // find weekDay
  print('${j1}.weekDay = ${j1.weekDay}'); // -> 6
  print('${g1}.weekDay = ${g1.weekDay}'); // -> 4

  // copy method
  print('$j1 with year = 1300 is ${j1.copy(year: 1300)}');
  // prints: 1391/10/21 with year = 1300 is 1300/10/21
  print('$g1 with month = 1 and day = 2 is ${g1.copy(month: 1, day: 2)}');
  // prints: 2013/1/10 with month = 1 and day = 2 is 2013/1/2

  // formatting examples:

  // example one:
  String format1(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  }

  print(format1(j1));
  // prints: پنج شنبه 21 دی 91
  print(format1(g1));
  // prints: Thursday 10 January 13

  // example one:
  String format2(Date d) {
    final f = d.formatter;

    return '${f.dd}/${f.mm}/${f.yyyy}';
  }

  print(format2(j1));
  // 21/10/1391
  print(format2(g1));
  // prints: 10/01/2013

  // comparing dates
  print(j1 > j2); // -> false
  print(j1 <= j2); // -> true
  print(g1 >= g2); // -> true
  print(g1.compareTo(g2)); // -> 0
  print(g1 == g2); // -> true
  print(g1 != g1); // -> false
}
``` 