# A Flutter package for using Jalali (Shamsi, Solar or Persian) date. You can convert and format Jalali and Georgian dates.

![Pub](https://img.shields.io/pub/v/shamsi_date.svg?color=blue)

Converted from the popular Javascript library [jalaali-js](https://github.com/jalaali/jalaali-js).

Calendar conversion is based on the [algorithm provided by Kazimierz M. Borkowski](http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm) and has a very good performance.

## Key Features
- Convert between [Jalali][], [Gregorian][] and Flutter's [DateTime][] objects.
- Format Jalali and Georgian dates with an easy and powerful syntax using [DateFormatter][].
- Access weekday, julian day number, month length and ...
- Check if you have a valid Jalali date or if the year is a leap year.
- Immutable date object with copy methods for easy manipulation.
- Compare Dates easily with comparison operators or by using [Comparable][].

## Issues and feature request
If you want a feature or you found an issue,
please make an issue on Github so I can see your request.

## Usage

Add it to your pubspec.yaml file:

```yaml
dependencies:
    shamsi_date: ^0.6.0
```

[Jalali][] class is used for Shamsi (Jalali or Persian) date and [Gregorian][] class is used for Gregorian date.
They can be instantiated by using their constructor:
```
Jalali(year, month, day)
Gregorian(year, month, day)
```
month and day default to 1

You can convert Jalali date to Gregorian by using `toGregorian()` method and convert Gregorian to Jalali date by using `toJalali()` method.

There are also factory methods `Jalali.fromGregorian(...)` and `Gregorian.fromJalali(...)` which can be used alternatively.

You can check Jalali date validity by `isValid()` method.
And find month length by `monthLength` getter.
And check if the year is a leap year by `isLeapYear()` method.

You can also convert [DateTime][] object directly to Jalali or Gregorian date by using:
```
Jalali.fromDateTime(dateTime)
Gregorian.fromDateTime(dateTime)
```
And convert Jalali and Gregorian to DateTime by using `toDateTime()` method. 
And you can get Jalali and Gregorian dates for now by using `now()` factory.

You can get week day number of Jalali and Gregorian by using `weekDay` getter.
Week days range from 1 to 7.
Jalali week starts with shanbe and Gregorian week starts with monday.

If you want only to change some fields of a Jalali or Gregorian date you can use `copy(...)` method on an existing object.

Date formatting is easy. At first you should make a function for you custom formatting:
Say you want to format as `WeekDayName Day MonthName TwoDigitYear`, call your function `format1`
```dart
String format1(Date d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
}
```
Then pass your Jalali or Gregorian dates to this function.
[Date][] is super interface of Jalali and Gregorian classes.

Or another example:
Say you want to format as `TwoDigitDay/TwoDigitMonth/FourDigitYear` or `DD/MM/YYYY`, call your function `format2`
```dart
String format2(Date d) {
  final f = d.formatter;

  return '${f.dd}/${f.mm}/${f.yyyy}';
}
```
And use it like before.

[DateFormatter][] has these getters:
- y: year (whatever length it has)
- yy: two digit year
- yyyy: four digit year
- m: month (whatever length it has)
- mm: two digit month
- mN: month name
- d: day (whatever length it has)
- dd: two digit day
- wN: week day name

You can get Date formatter by using `formatter` getter on Jalali and Gregorian date objects.
Simply cash this formatter in a final value and then use string interpolation (as we have shown in examples) for making your desired output.
This way of formatting is more powerful (and arguably easier) than using templates.

Jalali and Gregorian classes are [Comparable][] so you can compare them using `compareTo` method.
You can also use comparison operators to compare them.
They also support `equals` and `hashCode` functions.

Here is a complete example:

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

[Jalali]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Jalali-class.html
[Gregorian]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Gregorian-class.html
[DateTime]: https://docs.flutter.io/flutter/dart-core/DateTime-class.html
[Date]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Date-class.html
[DateFormatter]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/DateFormatter-class.html
[Comparable]: https://docs.flutter.io/flutter/dart-core/Comparable-class.html
