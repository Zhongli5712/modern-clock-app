import 'package:flutter/material.dart';
import 'alarm.dart';

/// Generate a number of Alarms for testing purpose.
List<Alarm> generateAlarms(int numAlarms) {
  return List<Alarm>.generate(numAlarms, (int index) {
    return Alarm(
      index.toString(),
      TimeOfDay(hour: index, minute: 0),
      AlarmFrequency.noRepeat()
    );
  });
}

class AlarmListWidget extends StatefulWidget {
  const AlarmListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmListWidget> {
  List<Alarm> _alarms = generateAlarms(5);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: _alarms.map((alarm) => AlarmWidget(alarm: alarm)).toList(),
    );
  }
}
