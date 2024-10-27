import 'package:flutter/material.dart';

class ClockInOutProvider with ChangeNotifier {
  DateTime? cycleBeginning;
  ClockInOutProvider() { initCycle(); }

  Future<void> switchClockInOut() async {
    cycleBeginning == null ? 
      cycleBeginning = DateTime.now() : 
      cycleBeginning = null;
  }

  Future<void> resetCycle() async {
    cycleBeginning = null;
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

  Future<void> initCycle() async {
    cycleBeginning = await getCurrentCycle();
    print(cycleBeginning);
    notifyListeners();
  }
}