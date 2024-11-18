import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_time_picker.dart';
import 'package:flutter_app/features/common/clock_in_out/model/clock_in_out_model.dart';

class MyWorkCyclesTile extends StatefulWidget {
  final WorkCycle workCycle;
  final bool isEditable;
  const MyWorkCyclesTile(
      {super.key,
      required this.workCycle,
      this.isEditable = false});

  @override
  State<MyWorkCyclesTile> createState() => _MyCyclesTileState();
}

class _MyCyclesTileState extends State<MyWorkCyclesTile> {
  @override
  void initState() {
    super.initState();
    startTime = widget.workCycle.startTime;
    endTime = widget.workCycle.endTime;
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
                    startTime,
                    onTimeChanged: widget.workCycle.setStartTime,
              ),
              MyTimePicker(
                initialTime:
                    endTime,
                    onTimeChanged: widget.workCycle.setEndTime,
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

