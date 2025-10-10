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
