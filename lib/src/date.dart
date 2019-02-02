library date;

/// Super interface of Jalali and Georgian classes
abstract class Date {
  /// Year
  int get year;

  /// Month
  int get month;

  /// Day
  int get day;

  /// Julian Day Number
  int get julianDayNumber;

  /// Week day number
  int get weekDay;
}
