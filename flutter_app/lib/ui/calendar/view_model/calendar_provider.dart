import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/functions/time.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/current_user.dart';
import 'package:flutter_app/data/repositories/users_repository.dart';
import 'package:flutter_app/domain/model_classes/statistics_dict.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle.dart';

class CalendarProvider with ChangeNotifier {
  late List<WorkCycleModel>? workCycles;
  late StatisticsModel? statisticsModel;
  late int _userId;

  CalendarProvider({
   required UsersRepository usersRepository,
   int? userId,
   }) :
    _usersRepository = usersRepository {
    load = Command0(_load);
    if (userId != null) {
     _userId = userId;
    }
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
          return Result.ok(null);
        case Error<StatisticsModel>():
          return Result.error(result.error);
      }
    }finally{
      notifyListeners();
    }
  }

 

  getEventsForDay(DateTime day) {
    return workCycles!.where((element) {
      return TimeUtils.isDayInWorkCycle(day, element.startTime, element.endTime);
    }).toList();
  }

  Future<List<WorkCycleModel>> getWorkCycles() async {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    return [
      WorkCycleModel(
          id: 6,
          startTime: DateTime.now().add(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 1, hours: 8)),
          type: WorkCycleType.remoteWork),
      WorkCycleModel(
          id: 7,
          startTime: DateTime.now().subtract(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 12, hours: -8)),
          type: WorkCycleType.approvedByLocation),
      WorkCycleModel(
          id: 8,
          startTime: DateTime.now().subtract(Duration(days: 10)),
          endTime: DateTime.now().subtract(Duration(days: 10, hours: -8)),
          type: WorkCycleType.approvedByManager),
      WorkCycleModel(
          id: 9,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycleModel(
          id: 10,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycleModel(
          id: 11,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),

      WorkCycleModel(
          id: 12,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
      WorkCycleModel(
          id: 13,
          startTime: DateTime.now().subtract(Duration(days: 4)),
          endTime: DateTime.now().subtract(Duration(days: 3, hours: 8)),
          type: WorkCycleType.approvedByQr),
    ];
  }
  

}