import 'package:flutter/material.dart';
import 'package:modern_clock_app/constants.dart';

class AlarmFrequency {
  static const dayOfWeekNames = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  static const dayOfWeekShortNames = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  final List<bool> frequency;

  const AlarmFrequency(this.frequency);
  const AlarmFrequency.noRepeat()
      : frequency = const [false, false, false, false, false, false, false];

  @override
  String toString() {
    String ret = frequency
                    .where((f) => f)
                    .toList()
                    .asMap()
                    .entries
                    .map((e) => dayOfWeekShortNames[e.key])
                    .join(", ");
    if (ret.isEmpty) {
      return "No repeat";
    }
    return ret;
  }
}

class AlarmSound {
  final String name;

  const AlarmSound(this.name);
}

class Alarm {
  String name;
  TimeOfDay time;
  bool isOn = false;
  AlarmFrequency frequency;
  bool vibrate = true;
  AlarmSound sound = defaultAlarmSound;

  Alarm(this.name, this.time, this.frequency);
  Alarm.from(Alarm a)
    : name = a.name,
      time = a.time,
      isOn = a.isOn,
      frequency = a.frequency,
      vibrate = a.vibrate,
      sound = a.sound;

  String getTimeString() {
    return '${time.hour}:${time.minute}';
  }
}

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({Key? key, required this.alarm}) : super(key: key);

  final Alarm alarm;

  @override
  State<StatefulWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  void _handleSwitchChange(bool value) {
    setState(() {
      widget.alarm.isOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.white38,
        child: Row(
          children: [
            Column(
              children: [
                Text(widget.alarm.name),
                Text(widget.alarm.getTimeString()),
                Text(widget.alarm.frequency.toString())
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Alarm tmp = Alarm.from(widget.alarm);
                        return AlertDialog(
                          scrollable: true,
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: tmp.name,
                                      icon: const Icon(Icons.label),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: tmp.time);
                                    },
                                    child: Text(tmp.getTimeString()))
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text("CANCEL"),
                              onPressed: () => Navigator.pop(context)
                            ),
                            TextButton(
                              child: const Text("APPLY"),
                              onPressed: () => Navigator.pop(context, tmp)
                            )
                          ],
                        );
                      });
                  },
                  icon: const Icon(Icons.settings)
                ),
                Switch(
                  onChanged: _handleSwitchChange,
                  value: widget.alarm.isOn,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmSettingsWidget extends StatefulWidget {
  const AlarmSettingsWidget({Key? key}) : super(key: key);

  @override
  State<AlarmSettingsWidget> createState() => _AlarmSettingsWidgetState();
}

class _AlarmSettingsWidgetState extends State<AlarmSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
