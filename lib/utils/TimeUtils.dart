import 'package:custom_bloc_state_management/utils/DateTimeFactory.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TimeUtils {
  static TimeUtils? _timeUtils;

  final DateTimeFactory _dateTimeFactory;

  TimeUtils._([this._dateTimeFactory = const DateTimeFactory()]);

  factory TimeUtils() {
    _timeUtils ??= TimeUtils._();
    return _timeUtils!;
  }

  factory TimeUtils.reset(DateTimeFactory dateTimeFactory) {
    _timeUtils = TimeUtils._(dateTimeFactory);
    return _timeUtils!;
  }

  int millisNow() {
    DateTime dateTime = _dateTimeFactory.now();
    return dateTime.toUtc().millisecondsSinceEpoch;
  }
}
