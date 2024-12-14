import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/models/work_cycle.dart';

class CalendarProvider with ChangeNotifier {
  late List<WorkCycle>? workCycles;
  bool isLoading = true;

  CalendarProvider() {
    initProvider();
  }

  Future<void> initProvider() async {
    print("object");
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
      return element.isDayInWorkCycle(day);
    }).toList();
  }

  Future<List<WorkCycle>> getWorkCycles() async {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    return [
      WorkCycle(
          id: 6,
          startTime: DateTime.now().add(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 1, hours: 8)),
          type: WorkCycleType.remoteWork),
      WorkCycle(
          id: 7,
          startTime: DateTime.now().subtract(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 12, hours: -8)),
          type: WorkCycleType.approvedByLocation),
      WorkCycle(
          id: 8,
          startTime: DateTime.now().subtract(Duration(days: 10)),
          endTime: DateTime.now().subtract(Duration(days: 10, hours: -8)),
          type: WorkCycleType.approvedByManager),
      WorkCycle(
          id: 9,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycle(
          id: 10,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycle(
          id: 11,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),

      WorkCycle(
          id: 12,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycle(
          id: 13,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
    ];
  }
}