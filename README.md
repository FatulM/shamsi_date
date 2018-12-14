# Jalali (Shamsi) and Georgian date conversion library for Flutter and Dart

Converted from Javascript library hosted on: [jalaali-js](https://github.com/jalaali/jalaali-js)

## Usage

Add it to your pubspec.yaml file:

```yaml
dependencies:
    shamsi_date: ^0.1.1
```

Import and use it:

```dart
import 'package:shamsi_date/shamsi_date.dart';

main() {
  final g1 = Gregorian(year: 2013, month: 1, day: 10);
  final j1 = g1.toJalali();
  print('$g1 is $j1');

  final j2 = Jalali(year: 1391, month: 10, day: 21);
  final g2 = j1.toGregorian();
  print('$j2 is $g2');
}
```
