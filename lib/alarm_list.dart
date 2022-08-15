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
  List<Alarm> _alarms = generateAlarms(9);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarms'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlarmSettingsWidget(tmpAlarm: Alarm.empty());
              }).then((newAlarm){
            setState(() {
              if (newAlarm != null) {
                _alarms.add(newAlarm);
              }
            });
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_alarm_rounded)
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _alarms.length,
          itemBuilder: (BuildContext context, int index) {
            return AlarmWidget(alarm: _alarms[index]);
          },
      ),
    );
  }
}
