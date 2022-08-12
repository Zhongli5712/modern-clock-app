import 'package:flutter/material.dart';

enum BurstStatus {on, off}

class BurstFrequency {
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;
  final bool sunday;

  const BurstFrequency.noRepeat()
      : monday = false,
        tuesday = false,
        wednesday = false,
        thursday = false,
        friday = false,
        saturday = false,
        sunday = false;
}


class Burst {
  String name;
  BurstFrequency frequency;
  TimeOfDay time;
  int totalAlarm = 0;
  bool isExpanded = false;

  Burst(this.name, this.frequency, this.time);

  ExpansionPanel getWidget() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(); //the header contain name, switch, time of the first alarm, freq, total
      },
      body: Container(), // list of all alarms
      isExpanded: isExpanded,
    );
  }
}
