import 'package:flutter/material.dart';
import 'alarm.dart';

List<Alarm> generateAlarms(int numAlarms) {
  return List<Alarm>.generate(numAlarms, (int index) {
    return Alarm(
      index.toString(),
      const AlarmFrequency.noRepeat(),
      TimeOfDay(hour: index, minute: 0)
    );
  });
}

class AlarmListWidget extends StatefulWidget {
  const AlarmListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlarmListState();

}

class _AlarmListState extends State<AlarmListWidget> {
  final List<Alarm> _alarms = generateAlarms(5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _alarms[index].isExpanded = !isExpanded;
        });
      },
      children: _alarms.map<ExpansionPanel>((Alarm alarm) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(alarm.name),
            );
          },
          body: ListTile(
              title: Text(alarm.time.toString()),
              subtitle:
              const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _alarms.removeWhere((Alarm currentAlarm) => alarm == currentAlarm);
                });
              }),
          isExpanded: alarm.isExpanded,
        );
      }).toList(),
    );
  }
}