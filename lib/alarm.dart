import 'package:flutter/material.dart';

enum AlarmStatus { on, off }

class AlarmFrequency {
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;
  final bool sunday;

  const AlarmFrequency.noRepeat()
      : monday = false,
        tuesday = false,
        wednesday = false,
        thursday = false,
        friday = false,
        saturday = false,
        sunday = false;
}

class Alarm {
  String name;
  AlarmStatus status = AlarmStatus.on;
  AlarmFrequency frequency;
  TimeOfDay time;

  Alarm(this.name, this.frequency, this.time);
}