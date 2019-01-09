# An Example for shamsi date package

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
}
```