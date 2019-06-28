# A Flutter package for using Jalali (Shamsi, Solar or Persian) date. You can convert and format Jalali and Georgian dates.

![Pub](https://img.shields.io/pub/v/shamsi_date.svg?color=blue)

Converted from the popular Javascript library [jalaali-js](https://github.com/jalaali/jalaali-js).

Calendar conversion is based on the [algorithm provided by Kazimierz M. Borkowski](http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm) and has a very good performance.

The package has a lot of unit tests for ensuring it's correctness. 

If you want a persian datetime picker there is one based on this library
[persian_datetime_picker](https://pub.dev/packages/persian_datetime_picker).

## Key Features
- Convert between [Jalali][], [Gregorian][] and Flutter's [DateTime][] objects.
- Access year, month, day, weekday, julian day number, month length and ... through getters.
- Format Jalali and Georgian dates with an easy and powerful syntax using [DateFormatter][].
- Check if you have a valid Jalali date or if the year is a leap year.
- Immutable date object with copy methods for easy manipulation.
- Compare Dates easily with comparison operators or by using [Comparable][].
- The package is mostly tested through unit tests.

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
month and day default to 1 if you don't specify them, for example:
```
Jalali(year, month) == Jalali(year, month, 1)
Gregorian(year) == Gregorian(year, 1, 1)
```

You can access `year`, `month`, `day` and `julianDayNumber` through getters on Jalali or Gregorian dates:
```dart
final j = Jalali(1397, 5, 6);

int jy = j.year; // jy = 1397
int jm = j.month; // jm = 5
int jd = j.day; // jd = 6
``` 

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
Jalali week starts with `shanbe` and Gregorian week starts with `monday`.

Jalali and Georgian dates are immutable so you can not change their properties in place.
So if you want only to change some fields of a Jalali or Gregorian date you can use `copy(...)`
method on an existing object, for example for getting date at start of this month in Jalali:
(copy method makes another Date instance and leaves the original one unchanged)
```dart
final j1 = Jalali.now().copy(day: 1); // correct way

// DON NOT do it like this:
final j2 = Jalali(Jalali.now().year, Jalali.now().month, 1); // INCORRECT, DO NOT USE THIS
```
or you want to get last day of the last month of this Jalali year:
```dart
final tmp = Jalali.now().copy(month: 12, day: 1);
// since we can be in a leap year we use monthLength:
final j = tmp.copy(day: tmp.monthLength);
```

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
Say you want to format as `FourDigitYear/TwoDigitMonth/TwoDigitDay` or `YYYY/MM/DD`, call your function `format2`
```dart
String format2(Date d) {
  final f = d.formatter;

  return '${f.yyyy}/${f.mm}/${f.dd}';
}
```
And use it like before.

Jalali and Georgian dates support `toString()` method, and it is semantically equivalent to use
a formatter as `Y/M/D` which means:
```dart
String toStringFormatter(Date d) {
  final f = d.formatter;

  return '${f.y}/${f.m}/${f.d}';
}
```
Note: in the following code toString() is called implicitly:
```
print(Jalali.now());
final str = 'today is: ${Georgian.now()}';
```
It is recommended that you use toString() of Jalali and Georgian dates only for development purpose,
like for debugging, logging or ...
You should use custom formatter for showing dates on UI.

*Note* also that you do not need for example to use ```int.parse()``` on formatter output of
```Jalali.now().formatter.m``` for accessing it's month, simply use ```Jalali.now().month```.

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

[Jalali]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Jalali-class.html
[Gregorian]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Gregorian-class.html
[DateTime]: https://docs.flutter.io/flutter/dart-core/DateTime-class.html
[Date]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/Date-class.html
[DateFormatter]: https://pub.dartlang.org/documentation/shamsi_date/latest/shamsi_date/DateFormatter-class.html
[Comparable]: https://docs.flutter.io/flutter/dart-core/Comparable-class.html
