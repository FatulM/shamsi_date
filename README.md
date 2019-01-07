# A Flutter package for using Jalali (Shamsi, Solar or Persian) date. You can convert Jalali and Georgian dates to each other.

Converted from the popular Javascript library [jalaali-js](https://github.com/jalaali/jalaali-js).

Calendar conversion is based on the [algorithm provided by Kazimierz M. Borkowski](http://www.astro.uni.torun.pl/~kb/Papers/EMP/PersianC-EMP.htm) and has a very good performance.

## Usage

Add it to your pubspec.yaml file:

```yaml
dependencies:
    shamsi_date: ^0.3.0
```

`Jalali` class is used for Shamsi (Jalali or Persian) date and `Gregorian` class is used for Gregorian date.
They can be instantiated by using their constructor:
```
Jalali(year, month, day)
Gregorian(year, month, day)
```
`month` and `day` default to 1

You can convert `Jalali` date to `Gregorian` by using `toGregorian()` method and convert `Gregorian` to `Jalali` date by using `toJalali()` method.

You can check `Jalali` date validity by `isValid()` method.
And find month length by `monthLength` getter.
And check if the year is a leap year by `isLeapYear()` method.

You can also convert `DateTime` object directly to `Jalali` or `Gregorian` date by using
```
Jalali.fromDate(dateTime)
Gregorian.fromDate(dateTime)
```

Here is an example:

```dart
import 'package:shamsi_date/shamsi_date.dart';

main() {
  final g1 = Gregorian(2013, 1, 10);
  final j1 = g1.toJalali();
  print('$g1 in Gregorian is $j1 in Jalali');

  final j2 = Jalali(1391, 10, 21);
  final g2 = j1.toGregorian();
  print('$j2 in Jalali is $g2  in Gregorian');

  // check validity
  print('$j1 is valid? ${j1.isValid()}');

  // check leap year
  print('1390 is leap year? ${Jalali(1390).isLeapYear()}');

  // find month length
  print('1390/12 month length? ${Jalali(1390, 12).monthLength}');
  
  final now = DateTime.now();
  print('now is ${Gregorian.fromDate(now)} in Gregorian');
  print('now is ${Jalali.fromDate(now)} in Jalali');
}
```
