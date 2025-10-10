# A Flutter and Dart Package for Jalali (Shamsi, Solar, Persian, Iranian, Jalaali, شمسی or خورشیدی) Calendar. Convert, Format or Manipulate Jalali and Gregorian (Miladi or میلادی) Date and Times.

[![pub](https://img.shields.io/pub/v/shamsi_date.svg?color=blue&label=shamsi_date)](https://pub.dev/packages/shamsi_date)
[![build](https://img.shields.io/github/actions/workflow/status/FatulM/shamsi_date/.github/workflows/build.yml?branch=master&label=build)](https://github.com/FatulM/shamsi_date/actions/workflows/build.yml)
[![coverage](https://img.shields.io/codecov/c/gh/FatulM/shamsi_date?label=coverage)](https://codecov.io/gh/FatulM/shamsi_date)

This is a pure dart package and Algorithm is based on popular JavaScript library [jalaali-js](https://github.com/jalaali/jalaali-js) with about 1M monthly downloads.

This package has a lot of unit tests with high test coverage for ensuring its correctness.

## Key Features

- Convert between [Jalali][], [Gregorian][] and Flutter's [DateTime][] objects.
- Access year, month, day, weekday, Julian day number, month length and ... through getters.
- Format Jalali and Georgian dates with an easy and powerful syntax using [DateFormatter][].
- Ensure Jalali and Georgian dates validity.
- Check if a Jalali or Gregorian year is leap.
- Immutable date objects with copy methods for easy manipulation.
- Compare Dates easily with comparison operators or by using [Comparable][].
- Add or subtract days with `+` and `-` operators.
- Find distance between dates by methods and `^` operator.
- Add years, months and days separately or as a combination with methods.
- High code coverage with a lot of unit tests.
- Null-Safe API.
- Support time information.

## Recent Changes

As of version `1.1.1` there are `mNFn` and `wNFn` getters on `JalaliFormatter` to get month names and weekday names in **Fingilish**.

As of version `1.1.0` there are time information formatters, like: `tH`, `tMM` and `tMSSS`. And a formatter for date seperator.

As of version `1.1.0` there is day of year getter on dates (`dayOfYear`) and formatter on formatters (`doy` and `dddoy`).

As of version `1.0.4` there is a `mNAf` getter on `JalaliFormatter` to get month names in **Afghanistan**.

As of version `1.0.3` there is a `fromMillisecondsSinceEpoch` factory method for Jalali and Gregorian.

As of version `1.0.1` there is `time` getter for Jalali and Gregorian to acquire time information in Duration.

As of version `1.0.0` Jalali and Gregorian include **time information**.

## Issues and feature requests

If you want a new feature, or you found an issue, please make an issue on GitHub, so I can see your request.

## Usage

Add it to your pubspec.yaml file:

```yaml
dependencies:
    shamsi_date: ^latest.version
```

Then depend on it:

```dart
import 'package:shamsi_date/shamsi_date.dart';
```

[Jalali][] class is used for **Shamsi (Jalali, Persian, شمسی or خورشیدی)** date and [Gregorian][] class is used for **Gregorian (Miladi or میلادی)** date. Jalali and Gregorian classes are the subclasses of [Date][].

Jalali and Gregorian can be instantiated with providing `year`, `month` and `day` among other ways:

```dart
Jalali j = Jalali(year, month, day);
Gregorian g = Gregorian(year, month, day);
```

you can also provide time information with `hour`, `minute`, `second` and `millisecond`.

```dart
Jalali j = Jalali(year, month, day, hour, minute, second, millisecond);
Gregorian g = Gregorian(year, month, day, hour, minute, second, millisecond);
```

Month and day has default value of `1` if you don't specify them, so `Jalali(year, month)` is equivalent to `Jalali(year, month, 1)` and `Gregorian(year)` is equivalent to `Gregorian(year, 1, 1)`. And also hour, minute, second and millisecond will default to `0` if not provided.

Constructor arguments should be non-null or exception will be thrown immediately. This ensures objects being in valid state when created. So year, month and day are always non-null. Almost all methods, operators, constructors and factories should have non-null arguments, and they will return non-null objects. For example year, month and day getters will return non-null results. The only exception for methods which can accept null arguments are methods with optional arguments like `add(...)` and `copy(...)`. **in nullsafe version:** nullable and non-nullable argument and return types are checked statically.

All created date instances are valid. When creating a date instance either by using constructors and factories or by using methods and operators on an existing date instance, if the new date is invalid (by its month or day being out of range), or it is out of computable range, a [DateException][] exception is thrown. So if you think the new date instance can become invalid or out of range you should surround it with try-catch and catching `DateException`. Minimum computable date is `Gregorian(560,3,20)` or equivalently `Jalali(-61,1,1)` and Maximum computable date is `Gregorian(3798,12,31)` or equivalently `Jalali(3177,10,11)`. For example:

```dart
void main() {
  try {
    Jalali jv = Jalali(1398, 13, 1); // not valid!
  } on DateException catch (e) {
    // prints: DateException: Jalali month is out of valid range.
    print(e);
  }
}
```

Jalali and Gregorian objects are immutable. So using operators and methods will give you  new object and does not manipulate the object in place, like String objects. Almost all other objects in shamsi_date library are immutable too.

You can access `year`, `month`, `day`, `hour`, `minute`, `second` and `millisecond` through getters on Jalali or Gregorian dates. You can get week day number of Jalali and Gregorian by using `weekDay` getter. Week days range from 1 to 7. Jalali week starts with `Shanbe` and Gregorian week starts with `Monday`. Month length can be accessed using `monthLength` getter. Month length is sensitive to leap years. you can check if the year is a leap year by `isLeapYear()` method. Julian day number is also accessible through `julianDayNumber` getter. You can get day of year using `dayOfYear` getter. for example:

```dart
Jalali j = Jalali(1397, 5, 6, 12, 56, 34, 585);

int jy = j.year; // 1397
int jm = j.month; // 5
int jd = j.day; // 6
int jth = j.hour; // 12
int jtm = j.minute; // 56
int jts = j.second; // 34
int jtms = j.millisecond; // 585

int wd = j.weekDay; // wd = 1 (Shanbe)

// month length of 1397/5
// note: day value is not important for monthLength
int ml = j.monthLength; // ml = 31

// check if 1397 is a leap year
// note: month and day values are not important for isLeapYear() method
bool ly = j.isLeapYear(); // ly = false (1397 is not leap year)

int doy = j.dayOfYear;

// and equivalently for Gregorian date objects ...
```

You can convert Jalali dates to Gregorian by using `toGregorian()` method and convert Gregorian to Jalali date by using `toJalali()` method. There are also factory methods `Jalali.fromGregorian(...)` and `Gregorian.fromJalali(...)` which can be used alternatively.

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

You can convert [DateTime][] objects directly to Jalali or Gregorian dates by using `fromDateTime(dateTime)` static methods. Convert Jalali and Gregorian to DateTime by using `toDateTime()` method. You can pass `hour`, `minute` and other time details to arguments. There is also `toUtcDateTime` for UTC date times. Get Jalali and Gregorian dates for now by using `now()` factory.

```dart
// convert from DateTime
Jalali j = Jalali.fromDateTime(dateTime);
Gregorian g = Gregorian.fromDateTime(dateTime);

// convert to DateTime
DateTime j2dt = j.toDateTime();
DateTime g2dt = g.toDateTime();

// and also convert to UTC:
DateTime j2dt2 = j.toUtcDateTime();

// get now
Jalali jNow = Jalali.now();
Gregorian gNow = Gregorian.now();
```

For converting [DateTime][] you can also use extension methods.

```dart
DateTime dt = DateTime.now();
Jalali j = dt.toJalali();
Gregorian g = dt.toGregorian();
```

Also you can create Jalali and Gregorian dates using millisecondsSinceEpoch factory method, which supports making dates in UTC timezone.

```dart
Jalali j = Jalali.fromMillisecondsSinceEpoch(1722782031520);
```

But keep in mind that Jalali and Gregorian dates do not store timezone information, So they won't store millisecondsSinceEpoch property internally.

Jalali and Georgian dates are immutable, so you can not change their properties in place. if you want only to change some fields of a Jalali or Gregorian date you can use `copy(...)` method or `withYear`, `withMonth` and `withDay` methods on an existing object. These methods can be chained. copy method changes all fields at one. **note** that copy and with*() methods are not safe, and it is your responsibility to avoid problems like month length bound (for example changing month of `31 Farvardin 1390` to `Esfand`) or leap crash (for example being in last day of year in a leap year and changing year to a non-leap one) in intermediate steps. order of operations is important.

For example for getting date at start of this month in Jalali: (copy method makes another object instance and leaves the original one unchanged)

```dart
Jalali j1 = Jalali.now().withDay(1); // correct way
// or by using copy method:
Jalali j2 = Jalali.now().copy(day: 1); // also correct

// DON NOT do it like this:
Jalali j3 = Jalali(Jalali.now().year, Jalali.now().month, 1); // INCORRECT
```
Or if you want to get last day of the last month of this Jalali year:
```dart
// at first go to first day of last month: (Avoid leap crash)
Jalali tmp = Jalali.now().withDay(1).withMonth(12);
// since we can be in a leap year we use monthLength for going to last day:
Jalali j = tmp.withDay(tmp.monthLength);

// or by using copy method:
Jalali tmp1 = Jalali.now().copy(month: 12, day: 1);
Jalali j1 = tmp.copy(day: tmp1.monthLength);
```
or to find 3rd day of 2nd month of this year:
```dart
Jalali j = Jalali.now().withDay(3).withMonth(2);

// or by using copy method:
Jalali j1 = Jalali.now().copy(month: 2, day: 3);
```
Or If you want your Jalali and Gregorian objects to fall back to today if null is provided as their constructor arguments you can use copy method from now factory method, for example for Jalali:
```dart
Jalali j = Jalali.now().copy(year: y, month: m, day: d);
// y, m and d can be null
```

You can find distance between Jalali and Gregorian dates by using `^` operator. Note that `-` operator is for something else. Or you can use `distanceTo` and `distanceFrom` methods.
```dart
int distance11 = Jalali.now() ^ Jalali(1395, 10, 1);
// or
int distance12 = Jalali.now().distanceFrom(Jalali(1395, 10, 1));
// or
int distance13 = Jalali(1395, 10, 1).distanceTo(Jalali.now());

// and similarly for Gregorian
int distance2 = Gregorian(2021) ^ Gregorian(2020);
```

You can add and subtract days to Jalali and Gregorian using `+` and `-` operators. It is guaranteed to give you a bound valid date. for example, it will go to next month or next year if needed, and they won't have leap crash.

You can add years, months or days to  Jalali and Gregorian using `addYears`, `addMonths` and `addDays`. These methods can be chained, and they will not have range crash. `addDays` can change month and year. `addMonths` can change year. **note** that it is your responsibility to avoid leap crash.

If you want you can add a combination of days, months or years to a date object with `add` method. **note** that `add` method is not safe and does not manipulate result to become bound valid, it is your responsibility. **It is recommended** to use addYear, addMonth and addDay methods over add method. **note** By using addYears, addMonth and addDay you can put day out of month length bounds. addMonth is safe for month overflow.

```dart
Jalali j1 = Jalali(1398, 8, 4);
// add days
Jalali j2 = j1 + 3; // -> 1398/8/7
// result will be manipulated to become valid:
Jalali j3 = j1 + 30; // -> 1398/9/4
Jalali j4 = j1 + 365; // -> 1399/8/4
// subtract days
Jalali j5 = j1 - 2; // -> 1398/8/2

// add years, months and days:
Jalali j6 = j1.addYears(1).addMonths(2).addDays(3); // 1399/10/7
// or:
Jalali j60 = j1.add(years: 1, months: 2, days: 3); // 1399/10/7
// add years and days only:
Jalali j7 = j1.addYears(1).addDays(3); // 1399/8/7
// or:
Jalali j70 = j1.add(years: 1, days: 3); // 1399/8/7
// add months only:
Jalali j8 = j1.addMonths(2); // 1398/10/3
// or:
Jalali j80 = j1.add(months: 2); // 1398/10/3
// if you want to subtract you can add negative value:
Jalali j9 = j1.addYears(-1); // 1397/8/3
// or:
Jalali j90 = j1.add(years: -1); // 1397/8/3

// addYears, addMonths and addDays methods are bound safe
// add(...) method is NOT bound safe
```

Date formatting is easy. You should make a function for custom formatting and then pass your Jalali or Gregorian dates to this function.

For example if you want to format as `WeekDayName Day MonthName TwoDigitYear` you make a function for it:

```dart
String format1(Date d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
}

// example output for Jalali: "پنجشنبه 21 دی 91"
// example output for Gregorian: "Thursday 10 January 13"
```

Or if you are living in **Afghanistan** you can use:

```dart
String format1Af(Jalali d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mNAf} ${f.yy}';
}

// example output: "پنجشنبه 21 جدی 91"
```

Or if you want to get Jalali formatting in Fingilish use:

```dart
String format1Fn(Jalali d) {
  final f = d.formatter;

  return '${f.wNFn} ${f.d} ${f.mNFn} ${f.yy}';
}

// example output: "Panjshanbeh 21 Dey 91"
```

Or if you want to format as `FourDigitYear/TwoDigitMonth/TwoDigitDay` or `YYYY/MM/DD`, you make a function for it:

```dart
String format2(Date d) {
  final f = d.formatter;

  return '${f.yyyy}/${f.mm}/${f.dd}';
}
```
Then use it like before.

**Note** that formatter formats digits in English so if you want Persian digits you can use fonts with Persian digits or apply a simple mapping to formatter output to change English digits to Persian.

Jalali and Georgian dates support `toString()` method. For Jalali, it is semantically equivalent to use a formatter as `Jalali(Y,M,D)` which means:

```dart
String toStringFormatter(Jalali d) {
  final f = d.formatter;

  return 'Jalali(${f.y},${f.m},${f.d}),${f.tH},${f.tM},${f.tS},${f.tMS}';
}
```
For Georgian, toString() is equivalent to using a formatter as `Georgian(Y,M,D,h,m,s,ms)`.

Note: in the following code toString() is called implicitly:

```dart
void main() {
    print(Jalali.now());
    final str = 'today is: ${Georgian.now()}';
}
```
Use toString() of Jalali and Georgian dates only for development purpose, like for debugging, logging or ... **You should** use formatters for showing dates on the UI.

If you want to format like `ISO8601` you can do the following:

```dart
String format3(Date d) {
  final f = d.formatter;

  return '${f.yyyy}-${f.mm}-${f.dd}T${f.tHH}:${f.tMM}:${f.tSS}.${f.tMSSS}';
}
```

If you want to use `/` instead of `-` for date separation use `formatter.sep` which changes based on date type.

**Note** also that you do not need for example to use `int.parse()` on formatter output of `Jalali.now().formatter.m` for accessing its month, simply use `Jalali.now().month`.

[DateFormatter][] has these getters:
- y: year (whatever length it has). year should be positive.
- yy: two digit year. year should be between 1000 and 9999.
- yyyy: four digit year. year should be between 0 and 9999.
- m: month (whatever length it has).
- mm: two-digit month.
- mN: month name.
- mNAf: month name in **Afghanistan**. (**ONLY** for `JalaliFormatter`.)
- mNFn: month name in **Fingilish**. (**ONLY** for `JalaliFormatter`.)
- d: day (whatever length it has).
- dd: two digit day.
- doy: day of year.
- dddoy: three-digit day of year.
- wN: week day name.
- wNFn: week day name in **Fingilish**. (**ONLY** for `JalaliFormatter`.)
- tH: hour.
- tHH: 2-digit hour.
- tM: minute.
- tMM: 2-digit minute.
- tS: seconds.
- tSS: two-digit seconds.
- tMS: milliseconds.
- tMSSS: three-digit milliseconds.
- sep: date seperator. `-` for Gregorian and `/` for Jalali.

You can get date formatter by using `formatter` getter on Jalali and Gregorian date objects. Simply cash this formatter in a Jalali value and then use string interpolation (as we have shown in examples) for making your desired output. This way of formatting is more powerful (and arguably easier) than using templates.

Jalali and Gregorian classes are [Comparable][], so you can compare them using `compareTo` method. You can also use comparison operators to compare them. They also support `equals` and `hashCode` functions. So you can safely use Sets and Maps of Jalali and Gregorian dates.

```dart
Jalali j1 = Jalali(1397, 1, 1);
Jalali j2 = Jalali(1397, 2, 1);

bool b1 = j1 < j2; // b1 = true
bool b2 = j1 >= j2; // b2 = false
// using Comparable compareTo
bool b3 = j1.compareTo(j2) > 0; // b3 = false (means j1 > j2 is false)
bool b4 = j1.compareTo(j2) <= 0; // b4 = true (means j1 <= j2 is true)
bool b5 = j1 == j2; // b5 = false
bool b6 = j1 != j2; // b6 = true
```

## Example

Here is a complete example. If you did not find what you are looking for, you can check `test/shamsi_date_test.dart` file which includes unit tests.

```dart
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  // Gregorian to Jalali conversion
  Gregorian g1 = Gregorian(2013, 1, 10, 12, 56, 34, 585);
  Jalali j1 = g1.toJalali();
  print('$g1 == $j1');
  // prints: Gregorian(2013,1,10) == Jalali(1391,10,21)
  // you can write Jalali.fromGregorian(g1) instead of g1.toJalali()

  // access year, month and day through getters
  // for Jalali:
  int j1y = j1.year; // j1y = 1391
  int j1m = j1.month; // j1m = 10
  int j1d = j1.day; // j1d = 21
  int j1th = j1.hour; // j1th = 12
  int j1tm = j1.minute; // j1tm = 56
  int j1ts = j1.second; // j1ts = 34
  int j1tms = j1.millisecond; // j1tms = 585
  print('j1 is $j1y-$j1m-$j1d:$j1th-$j1tm-$j1ts-$j1tms');
  // prints: j1 is 1397-10-21:12-56-34-585
  // NOTE: use formatters for formatting dates
  // and for Gregorian:
  int g1y = g1.year; // g1y = 2013
  int g1m = g1.month; // g1m = 1
  int g1d = g1.day; // g1d = 10
  print('g1 is $g1y-$g1m-$g1d'); // prints: g1 is 2013-1-10
  // NOTE: use formatters for formatting dates

  // Jalali to Gregorian conversion
  Jalali j2 = Jalali(1391, 10, 21);
  Gregorian g2 = j1.toGregorian();
  print('$j2 == $g2');
  // prints: Jalali(1391,10,21) == Gregorian(2013,1,10)
  // also can use Gregorian.fromJalali(j1) instead of j1.toGregorian()

  // find weekDay
  print('$j1 has weekDay ${j1.weekDay}'); // -> 6
  // 6 means "پنج شنیه"
  print('$g1 has weekDay ${g1.weekDay}'); // -> 4
  // 4 means "Thursday"

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

  // validity:
  // ALL created instances are considered VALID
  // if you think a date might invalid, use try-catch:
  try {
    Jalali jv = Jalali(1398, 13, 1); // not valid!
    print(jv); // this line is not reached
  } on DateException catch (e) {
    // prints: DateException: Jalali month is out of valid range.
    print(e);
  }
  // making leap crash will also throw exception:
  // for ex: Jalali(1394, 12, 30) will crash, since
  //  1394 is not leap year
  // creating dates out of computable range also throws DateException.

  // convert DateTime object to Jalali and Gregorian
  DateTime dateTime = DateTime.now();
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
  int thisJalaliYear = Jalali.now().year;
  print('this Jalali year is $thisJalaliYear');

  // copy method
  print('$j1 with year = 1300 is ${j1.copy(year: 1300)}');
  print('$j1 with hour = 23 is ${j1.copy(hour: 23)}');
  // prints: 1391/10/21 with year = 1300 is 1300/10/21
  print('$g1 with month = 1 and day = 2 is ${g1.copy(month: 1, day: 2)}');
  // prints: 2013/1/10 with month = 1 and day = 2 is 2013/1/2

  // withYear, withMonth and withDay methods:
  // these methods can be chained
  // it is recommended to use these methods over copy method
  print('$j1 with year = 1300 is ${j1.withYear(1300)}');
  // prints: 1391/10/21 with year = 1300 is 1300/10/21
  print('$g1 with month = 1 and day = 2 is ${g1.withDay(2).withMonth(1)}');
  // prints: 2013/1/10 with month = 1 and day = 2 is 2013/1/2

  // for example for getting date at start of this month in Jalali:
  print(Jalali.now().copy(day: 1));
  // for example to find 3rd day of 2nd month of this year:
  print(Jalali.now().copy(month: 2, day: 3));
  // DON NOT do it like this:
  print(Jalali(Jalali.now().year, Jalali.now().month, 1)); // INCORRECT
  // for example if you want to get
  // the last day of the last month of this Jalali year:
  Jalali tmp = Jalali.now().copy(month: 12, day: 1);
  // since we can be in a leap year we use monthLength:
  print(tmp.copy(day: tmp.monthLength));

  // add and subtract days
  Jalali d1 = Jalali(1398, 8, 4);
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
  // add hours and minutes:
  print(d1.add(hours: 1, minutes: 30)); // 1398/10/3
  // if you want to subtract you can add negative value:
  print(d1.add(years: -1)); // 1397/8/3
  // and also for Gregorian

  // you can find distance between two days with "^" operator
  int distance11 = Jalali.now() ^ Jalali(1395, 10);
  int distance12 = Jalali.now().distanceFrom(Jalali(1395, 10));
  int distance13 = Jalali(1395, 10).distanceTo(Jalali.now());
  print('distance $distance11 $distance12 $distance13');
  // and similarly for Gregorian

  // or you can use addYears, addMonths and addDays method
  // it is recommended to use these methods over add method
  // these methods are bound valid which means result will be
  //  manipulated to become valid, but add method is not
  print(d1.addDays(30)); // -> 1398/9/4
  print(d1.addDays(365)); // -> 1399/8/4
  print(d1.addYears(1).addMonths(2).addDays(3)); // 1399/10/7
  print(d1.addYears(1).addDays(3)); // 1399/8/7
  print(d1.addMonths(2)); // 1398/10/3
  print(d1.addYears(-1)); // 1397/8/3

  // formatting examples:

  // example one:
  String format1(Date d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  }

  print(format1(j1)); // prints: پنجشنبه 21 دی 91
  print(format1(g1)); // prints: Thursday 10 January 13

  // for Afghani people:
  String format1Af(Jalali d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mNAf} ${f.yy}';
  }

  print(format1Af(j1)); // prints: پنجشنبه 21 جدی 91

  // Finglish example:
  String format1Fn(Jalali d) {
    final f = d.formatter;

    return '${f.wNFn} ${f.d} ${f.mNFn} ${f.yy}';
  }

  print(format1Fn(j1)); // print: Panjshanbeh 21 Dey 91

  // example two:
  String format2(Date d) {
    final f = d.formatter;

    return '${f.dd}/${f.mm}/${f.yyyy}';
  }

  print(format2(j1)); // prints: 21/10/1391
  print(format2(g1)); // prints: 10/01/2013

  // DO NOT use formatter for accessing year, month or other properties
  // of date objects they are available as getters on date objects
  // INCORRECT EXAMPLE, DO NOT USE THIS:
  int j1y1 = int.parse(j1.formatter.yyyy); // INCORRECT
  print("j1's year is $j1y1");
  // use this:
  int j1y2 = j1.year; // correct
  print("j1's year is $j1y2");
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

  // if you want to compare Jalali with Georgian
  // you can convert one type to another,
  // for example:
  print(j1.toGregorian() == g1); // -> true
  // but if you don't want to convert them you can use julianDayNumber
  // (this approach is not recommended)
  print(j1.julianDayNumber == g1.julianDayNumber); // -> true
  // this means that they are equal
  // you can also use other comparison operators

  // you can use extension methods for DateTime
  final dtn = DateTime.now();
  print(dtn);
  final jn = dtn.toJalali();
  print(jn);
  final gn = dtn.toGregorian();
  print(gn);

  // also you can create a Jalali or Gregorian date from
  // milliseconds since epoch
  print(Jalali.fromMillisecondsSinceEpoch(1722782031520));
  print(Gregorian.fromMillisecondsSinceEpoch(1722782031520));
  // also there is a isUtc argument to control timezone
  // which is false by default
  print(Jalali.fromMillisecondsSinceEpoch(1722782031520, isUtc: true));

  // you can create dates using julian day number using factory method
  print(Jalali.fromJulianDayNumber(2460527));
  // or also provide time information
  print(Jalali.fromJulianDayNumber(2460527, 15, 36, 12, 156));
  // or get julian day number thr
  print(Jalali.now().julianDayNumber);

  // also you can get time information using time getter
  // this will result in a time duration from start of the day
  print(Jalali.now().time);
  // or get it in seconds or milliseconds
  print(Jalali.now().time.inSeconds);
  print(Jalali.now().time.inMicroseconds);

  // example three:
  String format3(Date d) {
    final f = d.formatter;

    return '${f.yyyy}-${f.mm}-${f.dd} ${f.tHH}:${f.tMM}:${f.tSS}.${f.tMSSS}';
  }

  print(format3(Jalali.now()));
  // prints for ex. 1404-02-12 14:44:13.879
  print(format3(Gregorian.now()));
  // prints for ex. 2025-05-02 14:44:13.879
}
```

[Jalali]: https://pub.dev/documentation/shamsi_date/latest/shamsi_date/Jalali-class.html
[Gregorian]: https://pub.dev/documentation/shamsi_date/latest/shamsi_date/Gregorian-class.html
[DateTime]: https://api.flutter.dev/flutter/dart-core/DateTime-class.html
[Date]: https://pub.dev/documentation/shamsi_date/latest/shamsi_date/Date-class.html
[DateFormatter]: https://pub.dev/documentation/shamsi_date/latest/shamsi_date/DateFormatter-class.html
[Comparable]: https://api.flutter.dev/flutter/dart-core/Comparable-class.html
[DateException]: https://pub.dev/documentation/shamsi_date/latest/shamsi_date/DateException-class.html
