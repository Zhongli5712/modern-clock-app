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

  List<bool> frequency;

  AlarmFrequency.from(AlarmFrequency af)
      : frequency = List.from(af.frequency);
  AlarmFrequency.noRepeat()
      : frequency = [false, false, false, false, false, false, false];

  @override
  String toString() {
    String ret = [for (var i = 0; i < 7; i++) i]
                    .map((i) => frequency[i] ? dayOfWeekShortNames[i] : "")
                    .where((e) => e != "")
                    .toList()
                    .join(", ");
    if (ret.isEmpty) {
      return "No repeat";
    } else if (ret == "Mon, Tue, Wed, Thu, Fri, Sat, Sun") {
      return "Everyday";
    }
    return ret;
  }
}

class AlarmSound {
  final String name;

  const AlarmSound(this.name);
}

class Alarm {
  String name = "";
  TimeOfDay time = TimeOfDay.now();
  bool isOn = false;
  AlarmFrequency frequency = AlarmFrequency.noRepeat();
  bool vibrate = true;
  AlarmSound sound = defaultAlarmSound;

  Alarm(this.name, this.time, this.frequency);
  Alarm.empty();
  Alarm.from(Alarm a)
    : name = a.name,
      time = a.time,
      isOn = a.isOn,
      frequency = AlarmFrequency.from(a.frequency),
      vibrate = a.vibrate,
      sound = a.sound;

  void copy(Alarm a) {
    name = a.name;
    time = a.time;
    isOn = a.isOn;
    frequency = AlarmFrequency.from(a.frequency);
    vibrate = a.vibrate;
    sound = a.sound;
  }

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
                        return AlarmSettingsWidget(tmpAlarm: Alarm.from(widget.alarm));
                      }).then((newAlarm){
                        setState(() {
                          if (newAlarm != null) {
                            widget.alarm.copy(newAlarm);
                          }
                        });
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
  const AlarmSettingsWidget({Key? key, required this.tmpAlarm})
        : super(key: key);

  final Alarm tmpAlarm;

  @override
  State<AlarmSettingsWidget> createState() => _AlarmSettingsWidgetState();
}

class _AlarmSettingsWidgetState extends State<AlarmSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.grey,
      child: contentBox(context),
    );
  }

  generateFrequencyButtons() {
    return [for (var i = 0; i < 7; i++) i].map(
      (i) => SizedBox(
          width: 35,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                widget.tmpAlarm.frequency.frequency[i] =
                          !widget.tmpAlarm.frequency.frequency[i];
              });
            },
            color: widget.tmpAlarm.frequency.frequency[i] ?
                          Colors.blue : Colors.grey,
            textColor: Colors.white,
            // padding: const EdgeInsets.all(16),
            shape: const CircleBorder(),
            child: Text(AlarmFrequency.dayOfWeekShortNames[i][0]),
          )
        )
      ).toList();
  }

  contentBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.tmpAlarm.name,
              decoration: const InputDecoration(
                labelText: 'Name',
                icon: Icon(Icons.label),
              ),
              onChanged: (String? value) {
                setState(() {
                  if (value == null) {
                    widget.tmpAlarm.name = "";
                  } else {
                    widget.tmpAlarm.name = value;
                  }
                });
              },
            ),
            TextButton(
                onPressed: () {
                  showTimePicker(
                      context: context,
                      initialTime: widget.tmpAlarm.time
                  ).then((newTime) {
                    setState(() {
                      if (newTime != null) {
                        widget.tmpAlarm.time = newTime;
                      }
                    });
                  });
                },
                child: Text(
                    widget.tmpAlarm.getTimeString(),
                    style: timeTextStyle,
                )
            ),
            Text(widget.tmpAlarm.frequency.toString()),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: generateFrequencyButtons()
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    child: const Text("CANCEL")
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(widget.tmpAlarm);
                    },
                    child: const Text("APPLY")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
