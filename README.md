# A Flutter package for using Jalali (Shamsi, Solar or Persian) date. You can convert Jalali and Georgian dates to each other.

Converted from the popular Javascript library [jalaali-js](https://github.com/jalaali/jalaali-js).

Calendar conversion is based on the [algorithm provided by Kazimierz M. Borkowski](http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm) and has a very good performance.

## Changes
Added date formatter for custom printing of date objects.

## Issues and feature request
Please make an issue on Github so I can see your request.

## Usage

Add it to your pubspec.yaml file:

```yaml
dependencies:
    shamsi_date: ^0.5.1
```

`Jalali` class is used for Shamsi (Jalali or Persian) date and `Gregorian` class is used for Gregorian date.
They can be instantiated by using their constructor:
```
Jalali(year, month, day)
Gregorian(year, month, day)
```
month and day default to 1

You can convert Jalali date to Gregorian by using `toGregorian()` method and convert Gregorian to Jalali date by using `toJalali()` method.

You can check Jalali date validity by `isValid()` method.
And find month length by `monthLength` getter.
And check if the year is a leap year by `isLeapYear()` method.

You can also convert `DateTime` object directly to Jalali or Gregorian date by using:
```
Jalali.fromDateTime(dateTime)
Gregorian.fromDateTime(dateTime)
```
And convert Jalali and Gregorian to DateTime by using `toDateTime()` method. 
And you can get Jalali and Gregorian dates for now by using `now()` factory.

You can get week day number of Jalali and Gregorian by using `weekDay` getter.
Week days range from 1 to 7.
Jalali week starts with shanbe and Gregorian week starts with monday.

Date formatting is easy. At first you should make a function for you custom formatting:
Say you want to format as `WeekDayName Day MonthName TwoDigitYear`, call your function `format1`
```dart
String format1(Date d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
}
```
Then pass your Jalali or Gregorian dates to this function.
Or another example:
Say you want to format as `TwoDigitDay/TwoDigitMonth/FourDigitYear` or `DD/MM/YYYY`, call your function `format2`
```dart
String format2(Date d) {
  final f = d.formatter;

  return '${f.dd}/${f.mm}/${f.yyyy}';
}
```
And use it like before.

`DateFormatter` has these getters:
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

Jalali and Gregorian classes are `Comparable` so you can compare them using `compareTo` method.

Here is a complete example:

```dart
import 'package:shamsi_date/shamsi_date.dart';

main() {
  // Gregorian to Jalali conversion
  final g1 = Gregorian(2013, 1, 10);
  final j1 = g1.toJalali();
  print('$g1 in Gregorian is $j1 in Jalali');
  // prints: 2013/1/10 in Gregorian is 1391/10/21 in Jalali

  // Jalali to Gregorian conversion
  final j2 = Jalali(1391, 10, 21);
  final g2 = j1.toGregorian();
  print('$j2 in Jalali is $g2  in Gregorian');
  // prints: 1391/10/21 in Jalali is 2013/1/10  in Gregorian

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
}
```
