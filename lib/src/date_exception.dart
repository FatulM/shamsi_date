// Copyright 2018 - 2020, Amirreza Madani. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library date_exception;

/// date exception
///
/// this can happen by creating invalid dates or going out of computable range
///
/// super class of all date exceptions
abstract class DateException implements Exception {
  /// Create a [DateException] with message
  ///
  /// throws on null arguments
  ///
  /// non-null
  factory DateException(String message) {
    return _DateExceptionImpl(message);
  }
}

/// implementation of [DateException] with message
class _DateExceptionImpl implements DateException {
  /// message
  ///
  /// non-null
  final String message;

  /// Create a [DateException] with message
  ///
  /// throws on null arguments
  ///
  /// non-null
  _DateExceptionImpl(this.message) {
    ArgumentError.checkNotNull(message, 'message');
  }

  /// exception description
  ///
  /// non-null
  @override
  String toString() {
    return 'DateException: $message';
  }
}
