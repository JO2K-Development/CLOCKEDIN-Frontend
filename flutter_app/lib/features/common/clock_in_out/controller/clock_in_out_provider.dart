import 'package:flutter/material.dart';
import 'package:flutter_app/features/common/clock_in_out/model/clock_in_out_model.dart';

class ClockInOutProvider with ChangeNotifier {
  DateTime? cycleBeginning;
  List<WorkCycle> workCycles = [];

  Future<void> initProvider() async {
    await initCycle();
    await initCycles();
    notifyListeners();
  }

  Future<void> initCycles() async {
    workCycles = await getWorkCycles();
  }

  Future<void> initCycle() async {
    cycleBeginning = await getCurrentCycle();
  }

  Future<void> switchClockInOut() async {
    // cycleBeginning = (await StorageHandler.retrieveValue('cycleBeginning'));
    cycleBeginning == null ? 
      cycleBeginning = DateTime.now() : 
      cycleBeginning = null;
    notifyListeners();
  }

  Future<void> buttonPressed() async {
    //TODO: efectively calls notifylisteners twice, is it correct?
    switchClockInOut();
    notifyListeners();
  }

  Future<void> resetCycle() async {
    cycleBeginning = DateTime.now();
    //TODO: BACKEND: update cycleBeginning in db
    notifyListeners();
  }

  Future<void> setCycle(DateTime? cycleBeginning) async {
    cycleBeginning == null ?
    this.cycleBeginning = cycleBeginning :
    this.cycleBeginning = DateTime.now();
    notifyListeners();
  }

  static Future<DateTime?> getCurrentCycle() async {
    //TODO: implement getCurrentCycle
    // getting it from db: Datetime | null
    return DateTime(1400, 1, 1, 0, 0);
  }
  
  getWorkCycles() {
    //TODO: implement getWorkCycles
    return [
      WorkCycle(id: 1, startTime: DateTime(1400, 1, 1, 0, 0), endTime: DateTime(1400, 1, 1, 0, 0)),
      WorkCycle(id: 2, startTime: DateTime(1400, 1, 1, 0, 0), endTime: DateTime(1400, 1, 1, 0, 0)),
      WorkCycle(id: 3, startTime: DateTime(1400, 1, 1, 0, 0), endTime: DateTime(1400, 1, 1, 0, 0)),
    ];
  } 

  
}