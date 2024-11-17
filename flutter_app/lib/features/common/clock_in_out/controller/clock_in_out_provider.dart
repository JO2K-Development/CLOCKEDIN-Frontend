import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/storage_handler.dart';

class ClockInOutProvider with ChangeNotifier {
  DateTime? cycleBeginning;
  ClockInOutProvider() { initCycle(); }

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

  Future<void> initCycle() async {
    cycleBeginning = await getCurrentCycle();
    print(cycleBeginning);
    notifyListeners();
  }
}