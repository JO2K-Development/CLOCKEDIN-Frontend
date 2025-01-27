import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';

class ClockInOutProvider with ChangeNotifier {
  List<WorkCycleModel>? workCycles;

  ClockInOutProvider({
    required CurrentUserRepository currentUserRepository,
  }) : _currentUserRepository = currentUserRepository {
    load = Command0(_load)..execute();
  }

  final CurrentUserRepository _currentUserRepository;
  late Command0 load;

  Timer? _timer;
  final ValueNotifier<int> _elapsedSeconds = ValueNotifier<int>(0);
  DateTime? _startTime;

  Timer? get timer => _timer; 
  ValueNotifier<int> get elapsedSeconds => _elapsedSeconds;
  DateTime? get startTime => _startTime;

  Future<Result<void>> _load() async {
    await Future.delayed(Duration(seconds: 1));

    try {
      final result = await _currentUserRepository.getWorkCycles();      
      switch (result) {
        case Ok<List<WorkCycleModel>>():
          workCycles = result.value;
          break;
        case Error<List<WorkCycleModel>>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
    return Result.ok(null);
  }
  // Future<bool> validateUpdatedCycle(WorkCycleModel cycle) async {
  //   bool _isOverlapping(WorkCycleModel newCycle, WorkCycleModel? w1, WorkCycleModel? w2) {
  //     return w1 == null
  //         ? true
  //         : newCycle.startTime.isBefore(w1.endTime) || w2 == null
  //             ? true
  //             : newCycle.endTime.isAfter(w2.startTime);
  //   }

  //   T getOrDefault<T>(List<T> list, int index, dynamic defaultValue) {
  //     if (index >= 0 && index < list.length) {
  //       return list[index];
  //     }
  //     return defaultValue;
  //   }

  //   //this has to be future cause there might have been changes in db
  //   List<WorkCycleModel> freshCycleFetch = await getWorkCycles();
  //   bool isRemoved =
  //       !(freshCycleFetch.any((element) => element.id == cycle.id));
  //   bool isOverlappingOldOrFresh = _isOverlapping(
  //           cycle,
  //           getOrDefault(workCycles, cycle.id - 1, null),
  //           getOrDefault(workCycles, cycle.id + 1, null)) ||
  //       _isOverlapping(cycle, getOrDefault(freshCycleFetch, cycle.id - 1, null),
  //           getOrDefault(freshCycleFetch, cycle.id + 1, null));

  //   // check if the fetched data should replace the old data
  //   for (var pair in IterableZip([freshCycleFetch, workCycles])) {
  //     if (pair[0].id == pair[1].id) {
  //       workCycles = freshCycleFetch;
  //       break;
  //     }
  //   }
  //   return !isRemoved && !isOverlappingOldOrFresh;
  // }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _elapsedSeconds.value += 1;
        notifyListeners();
    });
    _startTime = DateTime.now();
  }

  void resetTimer() async {
    _timer?.cancel();
    _timer = null;
    _elapsedSeconds.value = 0;
    _startTime = null;
    notifyListeners();
  }

  void switchTimer() {
    if (_timer == null) {
      startTimer();
    } else {
      resetTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  
}

