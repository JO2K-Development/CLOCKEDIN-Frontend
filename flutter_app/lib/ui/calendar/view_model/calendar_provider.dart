import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/functions/time.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/current_user_repository.dart';
import 'package:flutter_app/data/repositories/users_repository.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';

class CalendarProvider with ChangeNotifier {
  List<WorkCycleModel>? workCycles;
  StatisticsModel? statisticsModel;
  late int _userId;

  CalendarProvider({
   required UsersRepository usersRepository,
   int? userId,
   }) :
    _usersRepository = usersRepository {
    load = Command0(_load);
    userId != null ? _userId = userId : _userId = 0;
  }

  final UsersRepository _usersRepository;
  late Command0 load; 

  Future<Result<void>> _load() async {
    await Future.delayed(Duration(seconds: 1));
    try{
      final result = await _usersRepository.getStatistics(_userId);
      switch(result){
        case Ok<StatisticsModel>():
          statisticsModel = result.value;
          break;
        case Error<StatisticsModel>():
          return Result.error(result.error);
      }

      final workCycleResult = await _usersRepository.getWorkCycles(_userId);
      
      switch(workCycleResult){
        case Ok<List<WorkCycleModel>>():
          workCycles = workCycleResult.value;
          break;
        case Error<List<WorkCycleModel>>():
          return Result.error(workCycleResult.error);
      }
      
    } finally{
      notifyListeners();
    }

    return Result.ok(null);
  }

 

  getEventsForDay(DateTime day) {
    return workCycles!.where((element) {
      return TimeUtils.dayWorkCycleOverlap(day, element.startTime, element.endTime);
    }).toList();
  }

  
  

}