/// date exception
class DateException {
  /// prevent creating instances
  DateException();

  /// exception message
  ///
  /// non-null
  @override
  String toString();
}

/// date out of computable range exception
class DateOutOfComputableRangeException extends DateException {
  /// prevent creating instances
  DateOutOfComputableRangeException();

  /// exception message
  ///
  /// non-null
  @override
  String toString();
}

/// date not valid exception
class DateNotValidException extends DateException {
  /// prevent creating instances
  DateNotValidException();

  /// exception message
  @override
  String toString();
}

/// Jalali out of computable range exception
class JalaliOutOfComputableRangeException
    extends DateOutOfComputableRangeException {
  /// expected Jalali year
  final int year;

  /// expected Jalali month
  final int month;

  /// expected Jalali day
  final int day;

  /// create an instance of JalaliOutOfComputableRangeException
  ///
  /// throws on null argument
  JalaliOutOfComputableRangeException(this.year, this.month, this.day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');
  }

  /// exception message
  ///
  /// non-null
  @override
  String toString() {
    return 'Jalali($year,$month,$day) is out of computable range';
  }

  /// throws [JalaliOutOfComputableRangeException] if is out of range
  ///
  /// throws on null argument
  static void check(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    if (isOutOfRange(year, month, day)) {
      throw JalaliOutOfComputableRangeException(year, month, day);
    }
  }

  /// check if Jalali is out of range
  ///
  /// throws on null argument
  ///
  /// non-null
  static bool isOutOfRange(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    // todo
    return true;
  }
}

/// Gregorian out of computable range exception
class GregorianOutOfComputableRangeException
    extends DateOutOfComputableRangeException {
  /// expected Gregorian year
  final int year;

  /// expected Gregorian month
  final int month;

  /// expected Gregorian day
  final int day;

  /// create an instance of GregorianOutOfComputableRangeException
  ///
  /// throws on null argument
  GregorianOutOfComputableRangeException(this.year, this.month, this.day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');
  }

  /// exception message
  ///
  /// non-null
  @override
  String toString() {
    return 'Gregorian($year,$month,$day) is out of computable range';
  }

  /// throws [GregorianOutOfComputableRangeException] if is out of range
  ///
  /// throws on null argument
  static void check(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    if (isOutOfRange(year, month, day)) {
      throw GregorianOutOfComputableRangeException(year, month, day);
    }
  }

  /// check if Gregorian is out of range
  ///
  /// throws on null argument
  ///
  /// non-null
  static bool isOutOfRange(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    // todo
    return true;
  }
}

/// Julian day number out of computable range exception
class JulianDayNumberOutOfComputableRangeException
    extends DateOutOfComputableRangeException {
  /// expected Julian day number
  final int julianDayNumber;

  /// create an instance of JulianDayNumberOutOfComputableRangeException
  ///
  /// throws on null argument
  JulianDayNumberOutOfComputableRangeException(this.julianDayNumber) {
    ArgumentError.checkNotNull(julianDayNumber, 'julianDayNumber');
  }

  /// exception message
  ///
  /// non-null
  @override
  String toString() {
    return 'Julian day number $julianDayNumber is out of computable range';
  }

  /// throws [JulianDayNumberOutOfComputableRangeException] if is out of range
  ///
  /// throws on null argument
  static void check(int julianDayNumber) {
    ArgumentError.checkNotNull(julianDayNumber, 'julianDayNumber');

    if (isOutOfRange(julianDayNumber)) {
      throw JulianDayNumberOutOfComputableRangeException(julianDayNumber);
    }
  }

  /// check if Julian day number is out of range
  ///
  /// throws on null argument
  ///
  /// non-null
  static bool isOutOfRange(int julianDayNumber) {
    ArgumentError.checkNotNull(julianDayNumber, 'julianDayNumber');

    // todo
    return true;
  }
}

/// Jalali not valid exception
class JalaliNotValidException extends DateNotValidException {
  /// expected Jalali year
  final int year;

  /// expected Jalali month
  final int month;

  /// expected Jalali day
  final int day;

  /// create an instance of JalaliNotValidException
  ///
  /// throws on null argument
  JalaliNotValidException(this.year, this.month, this.day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');
  }

  /// exception message
  ///
  /// non-null
  @override
  String toString() {
    return 'Jalali($year,$month,$day) is out of computable range';
  }

  /// throws [JalaliNotValidException] if is not valid
  ///
  /// throws on null argument
  static void check(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    if (isValid(year, month, day)) {
      throw JalaliNotValidException(year, month, day);
    }
  }

  /// checks if Jalali is valid
  ///
  /// throws on null argument
  ///
  /// non-null
  static bool isValid(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    // todo
    return true;
  }
}

/// Gregorian not valid exception
class GregorianNotValidException extends DateNotValidException {
  /// expected Gregorian year
  final int year;

  /// expected Gregorian month
  final int month;

  /// expected Gregorian day
  final int day;

  /// create an instance of GregorianNotValidException
  ///
  /// throws on null argument
  GregorianNotValidException(this.year, this.month, this.day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');
  }

  /// exception message
  ///
  /// non-null
  @override
  String toString() {
    return 'Gregorian($year,$month,$day) is out of computable range';
  }

  /// throws [GregorianNotValidException] if is not valid
  static void check(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    if (isValid(year, month, day)) {
      throw GregorianNotValidException(year, month, day);
    }
  }

  /// checks if Gregorian is valid
  ///
  /// throws on null argument
  ///
  /// non-null
  static bool isValid(int year, int month, int day) {
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    ArgumentError.checkNotNull(day, 'day');

    // todo
    return true;
  }
}
