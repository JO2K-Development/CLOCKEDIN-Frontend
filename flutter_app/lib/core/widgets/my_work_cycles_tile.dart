import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_time_picker.dart';

class MyWorkCyclesTile extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;
  final bool isEditable;
  const MyWorkCyclesTile(
      {super.key,
      required this.startTime,
      required this.endTime,
      this.isEditable = false});

  @override
  State<MyWorkCyclesTile> createState() => _MyCyclesTileState();
}

class _MyCyclesTileState extends State<MyWorkCyclesTile> {
  @override
  void initState() {
    super.initState();
    startTime = widget.startTime;
    endTime = widget.endTime;
  }

  bool isInEdit = false;
  late DateTime startTime;
  late DateTime endTime;

  @override
  Widget build(BuildContext context) {
    Widget beveledContainerContent = widget.isEditable
        ? Column(
            children: [
              MyTimePicker(
                initialTime:
                    TimeOfDay(hour: startTime.hour, minute: startTime.minute),
                    onTimeChanged: (e) => {},
              ),
              MyTimePicker(
                initialTime:
                    TimeOfDay(hour: endTime.hour, minute: endTime.minute),
                    onTimeChanged: (e) => {},
              ),
            ],
          )
        : Column(
            children: [
              Text('Start Time: ${startTime.toString()}'),
              Text('End Time: ${endTime.toString()}'),
            ],
          );
    return MyBeveledContainer(
        // isBackGPrimary: true, 
        child: beveledContainerContent);
  }
}
