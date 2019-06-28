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

  // access year, month and day through getters
  // for Jalali:
  final int g1y = g1.year; // g1y = 2013
  final int g1m = g1.month; // g1m = 1
  final int g1d = g1.day; // g1d = 10
  // and for Gregorian:
  final int j1y = j1.year; // j1y = 1391 
  final int j1m = j1.month; // j1m = 10
  final int j1d = j1.day; // j1d = 21

  // Jalali to Gregorian conversion
  final j2 = Jalali(1391, 10, 21);
  final g2 = j1.toGregorian();
  print('$j2 in Jalali is $g2  in Gregorian');
  // prints: 1391/10/21 in Jalali is 2013/1/10  in Gregorian
  // you can write Gregorian.fromJalali(j1) instead of j1.toGregorian()

  // find out which jalali year is this year:
  final int thisYear = Jalali.now().year;

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

  // for example for getting date at start of this month in Jalali:
  print(Jalali.now().copy(day: 1));
  // DON NOT do it like this:
  print(Jalali(Jalali.now().year, Jalali.now().month, 1)); // INCORRECT, DO NOT USE THIS
  // for example if you want to get last day of the last month of this Jalali year:
  final tmp = Jalali.now().copy(month: 12, day: 1);
  // since we can be in a leap year we use monthLength:
  print(tmp.copy(day: tmp.monthLength));

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

  // DO NOT use formatter for accessing year, month or other properties of date objects
  // they are available as getters on date objects
  // INCORRECT EXAMPLE:
  final int ty1 = int.parse(Jalali.now().formatter.yyyy); // INCORRECT, DO NOT USE THIS
  // use this:
  final int ty2 = Jalali.now().year; // correct
  // also using toString() for showing dates on UI is not recommended, use custom formatter.

  // comparing dates
  print(j1 > j2); // -> false
  print(j1 <= j2); // -> true
  print(g1 >= g2); // -> true
  print(g1.compareTo(g2)); // -> 0
  print(g1 == g2); // -> true
  print(g1 != g1); // -> false

  // if you want to compare Jalali with Georgian you can convert one type to another, for example:
  print(j1.toGregorian() == g1); // -> true
  // but if you don't want to convert them you can use julianDayNumber
  // (this approach is not recommended) 
  print(j1.julianDayNumber == g1.julianDayNumber); // -> true 
  // this means that they are equal
  // you can also use other comparison operators
}
``` 