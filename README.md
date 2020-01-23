# A Flutter package for using Jalali (Shamsi, Solar or Persian) date. You can convert, format and manipulate Jalali and Georgian dates.

[![Pub](https://img.shields.io/pub/v/shamsi_date.svg?color=blue)](https://pub.dev/packages/shamsi_date) [![Build Status](https://travis-ci.org/FatulM/shamsi_date.svg?branch=master)](https://travis-ci.org/FatulM/shamsi_date) [![codecov](https://codecov.io/gh/FatulM/shamsi_date/branch/master/graph/badge.svg)](https://codecov.io/gh/FatulM/shamsi_date)

Algorithm is based on popular JavaScript library [jalaali-js](https://github.com/jalaali/jalaali-js) with more than 20k monthly downloads.

This package has a lot of unit tests with high test coverage for ensuring it's correctness.

## Key Features
- Convert between [Jalali][], [Gregorian][] and Flutter's [DateTime][] objects.
- Access year, month, day, weekday, Julian day number, month length and ... through getters.
- Format Jalali and Georgian dates with an easy and powerful syntax using [DateFormatter][].
- Check Jalali or Gregorian date validity.
- Check if a Jalali or Gregorian year is leap.
- Immutable date objects with copy methods for easy manipulation.
- Compare Dates easily with comparison operators or by using [Comparable][].
- Add or subtract days with operators, or add a combination of year, month and day with methods.
- High code coverage with a lot of unit tests.

## Recent Changes
**BREAKING CHANGE:** `toString()` method output is changed.
It will give `Jalali(y,m,d)` for Jalali and `Gregorian(y,m,d)` for Gregorian.
**Use** formatter for custom formatting.

Now you can add or subtract days to a Jalali or Gregorian date using + and - operators.
You can also add a combination of year, month or day through add method.

## Issues and feature request
If you want a feature or you found an issue,
please make an issue on GitHub so I can see your request.

## Usage
Add it to your pubspec.yaml file:
```yaml
dependencies:
    shamsi_date: ^0.8.0
```

[Jalali][] class is used for Shamsi (Jalali or Persian) date and [Gregorian][] class is used for Gregorian date.
They can be instantiated by using their constructor:
```dart
Jalali j = Jalali(year, month, day);
Gregorian g = Gregorian(year, month, day);
```
month and day default to 1 if you don't specify them, for example:
```dart
bool b1 = Jalali(year, month) == Jalali(year, month, 1); // b1 = true
bool b2 = Gregorian(year) == Gregorian(year, 1, 1); // b2 = true
```

You can access `year`, `month`, `day` and `julianDayNumber` through getters on Jalali or Gregorian dates.
You can get week day number of Jalali and Gregorian by using `weekDay` getter.
Week days range from 1 to 7.
Jalali week starts with `Shanbe` and Gregorian week starts with `Monday`.
And find month length by `monthLength` getter.
You can check Jalali date validity by `isValid()` method.
And check if the year is a leap year by `isLeapYear()` method.
```dart
Jalali j = Jalali(1397, 5, 6);

int jy = j.year; // jy = 1397
int jm = j.month; // jm = 5
int jd = j.day; // jd = 6

int wd = j.weekDay; // wd = 1 (Shanbe)

// month length of 1397/5
// note: day value is not important for monthLength
int ml = j.monthLength; // ml = 31

// check if 1397 is a leap year
// note: month and day values are not important for isLeapYear() method
bool ly = j.isLeapYear(); // ly = false (1397 is not leap year)

// check date validity of 1397/5/6
bool v = j.isValid(); // v = true (1397/5/6 is valid)

// and equivalently for Gregorian date objects ...
```

You can convert Jalali date to Gregorian by using `toGregorian()` method and convert Gregorian to Jalali date by using `toJalali()` method.
There are also factory methods `Jalali.fromGregorian(...)` and `Gregorian.fromJalali(...)` which can be used alternatively.

```dart
Jalali j = Jalali(1397, 5, 6);
// convert to Gregorian:
Gregorian j2g1 = j.toGregorian(); // -> 2018/8/28
// or equivalently:
Gregorian j2g2 = Gregorian.fromJalali(j);

Gregorian g = Gregorian(2019, 10, 26);
// convert to Jalali:
Jalali g2j1 = g.toJalali(); // -> 1398/8/4
// or equivalently:
Jalali g2j2 = Jalali.fromGregorian(g);
```

You can also convert [DateTime][] object directly to Jalali or Gregorian date by using:
And convert Jalali and Gregorian to DateTime by using `toDateTime()` method. 
And you can get Jalali and Gregorian dates for now by using `now()` factory.

```dart
// convert from DateTime
Jalali j = Jalali.fromDateTime(dateTime);
Gregorian g = Gregorian.fromDateTime(dateTime);

// convert to DateTime
DateTime j2d = j.toDateTime();
DateTime g2d = g.toDateTime();

// get now
Jalali jNow = Jalali.now();
Gregorian gNow = g.now();
```

Jalali and Georgian dates are immutable so you can not change their properties in place.
So if you want only to change some fields of a Jalali or Gregorian date you can use `copy(...)`
method on an existing object, for example for getting date at start of this month in Jalali:
(copy method makes another Date instance and leaves the original one unchanged)
```dart
final j1 = Jalali.now().copy(day: 1); // correct way

// DON NOT do it like this:
final j2 = Jalali(Jalali.now().year, Jalali.now().month, 1); // INCORRECT
```
or you want to get last day of the last month of this Jalali year:
```dart
// at first go to first day of last month:
final tmp = Jalali.now().copy(month: 12, day: 1);
// since we can be in a leap year we use monthLength for going to last day:
final j = tmp.copy(day: tmp.monthLength);
```
or to find 3rd day of 2nd month of this year:
```dart
final j = Jalali.now().copy(month: 2, day: 3);
```

You can add and subtract days to Jalali and Gregorian using `+` and `-` operators.
It is guaranteed to give you a valid date for example it will go to next month or year if needed.
If you want you can add a combination of days, months or years to a date object with `add` method.
note `add` method does not manipulate result to become valid, it is your responsibility.

```dart
final j1 = Jalali(1398, 8, 4);
// add days
final j2 = j1 + 3; // -> 1398/8/7
// result will be manipulated to become valid:
final j3 = j1 + 30; // -> 1398/9/4
final j4 = j1 + 365; // -> 1399/8/4
// subtract days
final j5 = j1 - 2; // -> 1398/8/2

// add years, months and days:
final j6 = j1.add(years: 1, months: 2, days: 3); // 1399/10/7
// add years and days only:
final j7 = j1.add(years: 1, days: 3); // 1399/8/7
// add months only:
final j8 = j1.add(months: 2); // 1398/10/3
// if you want to subtract you can add negative value:
final j9 = j1.add(years: -1); // 1397/8/3
```

Date formatting is easy. At first you should make a function for you custom formatting:
Say you want to format as `WeekDayName Day MonthName TwoDigitYear`, call your function `format1`

```dart
String format1(Date d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
}

// example output for Jalali: "پنج شنبه 21 دی 91"
// example output for Gregorian: "Thursday 10 January 13"
```
Then pass your Jalali or Gregorian dates to this function.
[Date][] is super interface of Jalali and Gregorian classes.

Or another example:
Say you want to format as `FourDigitYear/TwoDigitMonth/TwoDigitDay` or `YYYY/MM/DD`, call your function `format2`
```dart
String format2(Date d) {
  final f = d.formatter;

  return '${f.yyyy}/${f.mm}/${f.dd}';
}
```
And use it like before.

Note that formatter formats digits in English so if you want Persian digits you can use fonts with Persian digits or apply a simple mapping to formatter output to change English digits to Persian.

Jalali and Georgian dates support `toString()` method. For Jalali it is semantically equivalent to use
a formatter as `Jalali(Y,M,D)` which means:

```dart
String toStringFormatter(Jalali d) {
  final f = d.formatter;

  return 'Jalali(${f.y},${f.m},${f.d})';
}
```
And for Georgian, toString() is equivalent to using a formatter as `Georgian(Y,M,D)`
Note: in the following code toString() is called implicitly:
```dart
main() {
    print(Jalali.now());
    final str = 'today is: ${Georgian.now()}';
}
```
Use toString() of Jalali and Georgian dates only for development purpose, like for debugging, logging or ...
**You should** use custom formatter for showing dates on UI.

**Note** also that you do not need for example to use `int.parse()` on formatter output of
`Jalali.now().formatter.m` for accessing it's month, simply use `Jalali.now().month`.

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
Simply cash this formatter in a final value and then use string interpolation
(as we have shown in examples) for making your desired output.
This way of formatting is more powerful (and arguably easier) than using templates.

Jalali and Gregorian classes are [Comparable][] so you can compare them using `compareTo` method.
You can also use comparison operators to compare them.
They also support `equals` and `hashCode` functions. So you can safely use Sets and Maps of Jalali and Gregorian dates.
```dart
final j1 = Jalali(1397, 1, 1);
final j2 = Jalali(1397, 2, 1);

bool b1 = j1 < j2; // b1 = true
bool b2 = j1 >= j2; // b2 = false
// using Comparable's compareTo
bool b3 = j1.compareTo(j2) > 0; // b3 = false (means j1 > j2 is false)
bool b4 = j1.compareTo(j2) <= 0; // b4 = true (means j1 <= j2 is true)
bool b5 = j1 == j2; // b5 = false
bool b6 = j1 != j2; // b6 = true
```

Here is a complete example:

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

[Jalali]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Jalali-class.html
[Gregorian]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Gregorian-class.html
[DateTime]: https://docs.flutter.io/flutter/dart-core/DateTime-class.html
[Date]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Date-class.html
[DateFormatter]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/DateFormatter-class.html
[Comparable]: https://docs.flutter.io/flutter/dart-core/Comparable-class.html
