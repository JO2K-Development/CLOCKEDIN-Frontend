import 'package:flutter/material.dart';
import 'package:flutter_app/features/common/clock_in_out/model/clock_in_out_model.dart';

class ClockInOutProvider with ChangeNotifier {
  List<WorkCycle> workCycles = [];
  bool isLoading = true;

  ClockInOutProvider() {
    initProvider();
  }

  Future<void> initProvider() async {
    await Future.delayed(Duration(seconds: 1));
    await initCycles();
    isLoading = false;
    notifyListeners();
  }

  Future<void> initCycles() async {
    workCycles = await getWorkCycles();
  }
 
  getWorkCycles() {
    //TODO: implement getWorkCycles
    return [
      WorkCycle(id: 1, startTime: DateTime(1400, 1, 1, 0, 0), endTime: DateTime(1400, 1, 1, 0, 0)),
      WorkCycle(id: 2, startTime: DateTime.now(), endTime: DateTime(1400, 1, 1, 0, 0)),
      WorkCycle(id: 3, startTime: DateTime(1400, 1, 1, 0, 0), endTime: DateTime(1400, 1, 1, 0, 0)),
    ];
  } 

  
}