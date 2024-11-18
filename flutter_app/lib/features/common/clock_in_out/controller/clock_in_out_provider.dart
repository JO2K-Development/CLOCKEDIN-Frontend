import 'dart:math';

import 'package:collection/collection.dart';
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

  Future<bool> validateUpdatedCycle(WorkCycle cycle) async {
    bool _isOverlapping(WorkCycle newCycle, WorkCycle? w1, WorkCycle? w2) {
      return w1 == null ? true : newCycle.startTime.isBefore(w1.endTime) ||
          w2 == null ? true : newCycle.endTime.isAfter(w2.startTime);
    }

    T getOrDefault<T>(List<T> list, int index, dynamic defaultValue) {
      if (index >= 0 && index < list.length) {
        return list[index];
      }
      return defaultValue;
    }

    //this has to be future cause there might have been changes in db
    List<WorkCycle> freshCycleFetch = await getWorkCycles();
    bool isRemoved =
        !(freshCycleFetch.any((element) => element.id == cycle.id));
    bool isOverlappingOldOrFresh = _isOverlapping(
        cycle,
        getOrDefault(workCycles, cycle.id - 1, null),
        getOrDefault(workCycles, cycle.id + 1, null)) ||
        _isOverlapping(
        cycle,
        getOrDefault(freshCycleFetch, cycle.id - 1, null),
        getOrDefault(freshCycleFetch, cycle.id + 1, null));

    // check if the fetched data should replace the old data
    for (var pair in IterableZip([freshCycleFetch, workCycles])) {
      if (pair[0].id == pair[1].id) {
        workCycles = freshCycleFetch;
        break;
      }
    }
    return !isRemoved && !isOverlappingOldOrFresh;
  }

  Future<List<WorkCycle>> getWorkCycles() async {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    return [
      WorkCycle(
          id: 1,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0)),
      WorkCycle(
          id: 2,
          startTime: DateTime.now(),
          endTime: DateTime(1400, 1, 1, 0, 0)),
      WorkCycle(
          id: 3,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0)),
    ];
  }
}
