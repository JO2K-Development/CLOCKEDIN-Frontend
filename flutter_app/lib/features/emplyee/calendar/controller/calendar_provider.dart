import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/models/work_cycle.dart';

class CalendarProvider with ChangeNotifier {
  late List<WorkCycle>? workCycles;
  bool isLoading = true;

  Future<void> initProvider() async {
    await Future.delayed(Duration(seconds: 1));
    await initCycles();
    isLoading = false;
    notifyListeners();
  }

  Future<void> initCycles() async {
    workCycles = await getWorkCycles();
  }


  getEventsForDay(DateTime day) {
    return workCycles!.where((element) {
      return element.startTime.day == day.day &&
          element.startTime.month == day.month &&
          element.startTime.year == day.year;
    }).toList();
  }

  Future<List<WorkCycle>> getWorkCycles() async {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    return [
      WorkCycle(
          id: 1,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.remoteWork),
      WorkCycle(
          id: 2,
          startTime: DateTime.now(),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.approvedByLocation),
      WorkCycle(
          id: 3,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.approvedByManager),
      WorkCycle(
          id: 3,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.approvedByQr),
    ];
  }
}