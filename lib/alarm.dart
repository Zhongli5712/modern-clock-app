import 'package:flutter/material.dart';

enum AlarmStatus { on, off }

class AlarmFrequency {
  static const dayOfWeekNames = [
    "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "Saturday", "Sunday"
  ];
  static const dayOfWeekShortNames = [
    "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
  ];

  final List<bool> frequency;

  const AlarmFrequency(this.frequency);
  const AlarmFrequency.noRepeat()
      : frequency = const [false, false, false, false, false, false, false];

  @override
  String toString() {
    return frequency
        .where((f) => f)
        .toList()
        .asMap()
        .entries
        .map((e) => dayOfWeekShortNames[e.key])
        .join(", ");
  }
}

class Alarm {
  String name;
  AlarmStatus status = AlarmStatus.on;
  AlarmFrequency frequency;
  TimeOfDay time;

  Alarm(this.name, this.frequency, this.time);
}

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({Key? key, required this.alarm}) : super(key: key);

  final Alarm alarm;

  @override
  State<StatefulWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            Text(widget.alarm.name),
            Text(widget.alarm.time.toString()),
            Text(widget.alarm.frequency.toString()),
          ],
        ),
        Switch(
          onChanged: (bool value) {
            setState(() {
            widget.alarm.status = value ? AlarmStatus.on : AlarmStatus.off;
            });
          },
          value: widget.alarm.status == AlarmStatus.on ? true : false,
        ),
      ],
    );
  }

}