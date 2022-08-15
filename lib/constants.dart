import 'package:flutter/material.dart';

import 'alarm.dart';

/// ***** Alarm Constants ********/
AlarmSound defaultAlarmSound = const AlarmSound("Default");

/// ***** Text styles ************/

/// Text style for TextButton
TextStyle textButtonTextStyle = const TextStyle(
    color: Colors.blue,
    fontSize: 16,
    fontWeight: FontWeight.w500,
);
/// Text style for time text in settings dialog.
TextStyle timeSettingsTextStyle = const TextStyle(
  color: Colors.blue,
  backgroundColor: Colors.white54,
  fontSize: 48,
  fontWeight: FontWeight.bold
);
/// Text style for time text in alarms list.
TextStyle timeAlarmsListTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 35,
    fontWeight: FontWeight.bold
);
