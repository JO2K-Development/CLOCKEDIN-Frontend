import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/users_repository.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';

class DayOfWorkProvider with ChangeNotifier {
  List<WorkCycleModel>? workCycles;
  StatisticsModel? statisticsModel;
  late int _userId;
  final DateTime day;

  DayOfWorkProvider({
   required UsersRepository usersRepository,
   required this.day,
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
      final result = await _usersRepository.getStatisticsForDay(_userId, day);
      switch(result){
        case Ok<StatisticsModel>():
          statisticsModel = result.value;
          break;
        case Error<StatisticsModel>():
          return Result.error(result.error);
      }

      final workCycleResult = await _usersRepository.getWorkCyclesForDay(_userId, day);

      switch(workCycleResult){
        case Ok<List<WorkCycleModel>>():
          workCycles = workCycleResult.value;
          break;
        case Error<List<WorkCycleModel>>():
          return Result.error(workCycleResult.error);
      }
      print(workCycleResult);
      print(result);
    } finally{
      notifyListeners();
    }

    return Result.ok(null);
  }
}