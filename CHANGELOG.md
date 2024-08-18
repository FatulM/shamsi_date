## 1.0.4

* ADDED month names for Afghanistan (#25)

## 1.0.3

* ADDED fromMillisecondsSinceEpoch factory methods for Jalali and Gregorian (#24)
* ADDED test cases from Iranian Calendar Authority (#23)
* UPDATED copyright

## 1.0.2

* UPDATED copyright

## 1.0.1

* FIXED compareTo bugs about time data (#14)
* ADDED time getter for Date to acquire time data in Duration

## 1.0.0

* ADDED time information to Jalali and Gregorian
* CHANGED toDateTime and toUtcDateTime implementation according to time information
* CHANGED toString implementation according to time information
* CHANGED merged extension functions in main library

## 0.16.0

* ADDED hour, ..., microSeconds arguments to toDateTime
* ADDED toUtcDateTime

## 0.15.0

* CHANGED all date instances are comparable with each other
* CHANGED internal state management to cache julian day number

## 0.14.1

* ADDED distance between methods and operator

## 0.14.0

* ADDED extension methods for DateTime

## 0.13.0

* REMOVED dependency to Flutter

## 0.12.0

* MIGRATED to flutter 2 and dart 2.12

## 0.11.0-nullsafety.0

* REFACTOR factored out common methods on Date
* IMPROVED docs

## 0.10.0-nullsafety.0

* ADDED nullsafety support
* UPDATED docs
* RENAMED static min and max constants

## 0.9.1

* FIXED Jalali and Gregorian toString
* UPDATE example application

## 0.9.0

* CHANGED validation process
* ADDED DateException
* REMOVED isValid method from Date
* ADDED MIN and MAX static constants to Jalali and Gregorian
* UPDATED documentation
* ADDED and IMPROVED tests
* CHANGED library URI references

## 0.8.1

* FIXED docs

## 0.8.0

* ADDED null checking for constructors and factories
* ADDED null checking for most of the methods
* ADDED addYears, addMonths and addDays methods for Jalali and Georgian
* ADDED withYear, withMonth and withDay methods for Jalali and Georgian
* ADDED more tests
* IMPROVED date formatter
* UPDATED documentation

## 0.7.1

* FIXED docs

## 0.7.0

* ADDED addition and subtraction operators for Jalali
* ADDED add method for Jalali
* ADDED isValid, isLeapYear and monthLength methods to Gregorian
* ADDED addition and subtraction operators for Gregorian
* ADDED add method for Gregorian
* REFACTORED and ADDED more tests
* CHANGED toString() implementation
* REFACTORED and ADDED docs

## 0.6.3

* ADDED Travis CI to project
* ADDED Codecov code coverage to project
* FIXED docs

## 0.6.2

* FIX a little issue with docs

## 0.6.1

* IMPROVED examples
* IMPROVED docs

## 0.6.0

* UPDATED project

## 0.5.5

* ADDED copy method

## 0.5.4

* Better documentation

## 0.5.3

* ADDED more tests
* ADDED fromJalali and fromGregorian methods

## 0.5.2

* ADDED comparison operators
* ADDED equals and hashCode

## 0.5.1

* ADDED Comparable to Jalali and Gregorian

## 0.5.0

* ADDED date formatter

## 0.4.3

* CHANGED internal package structure

## 0.4.2

* ADDED more test cases
* Refactored code and docs

## 0.4.1

* ADDED weekDay

## 0.4.0

* ADDED Date as super interface

## 0.3.1

* ADDED toDateTime
* CHANGED fromDate name to fromDateTime
* ADDED now factory

## 0.3.0

* ADDED fromDate constructor

## 0.2.1

* CHANGED static methods
* CHANGED monthLength to getter

## 0.2.0

* CHANGED constructor type

## 0.1

* Initial version
