import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/functions/time.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/users_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import '../../../core/navigation/navigation_handler.dart';

class UsersRepositoryTesting extends UsersRepository {
  UsersRepositoryTesting(
    {
      required LocalDataService localDataService,
    }
  ):
    _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<CurrentUserModel>> getUser(int userId)async {
    
    return Result.error(Exception("Not yet implemented (could do a small cache of users in a designated serverClass)"));
    
  }

  @override
  Future<Result<StatisticsModel>> getStatistics(int userId) async {
 StatisticsModel sM = StatisticsModel.fromJson({"result" : [
        {"simple" : {
          "name": "Statisctic one",
          "value": 234}},
        {"plot": {
          "title": "Example plot",
          "x_label": "Time",
          "y_label": "Value",
          "data": {
            "Jan": 35,
            "Feb": 28,
            "Mar": 34,
            "Apr": 32,
            "May": 40,
            "Jun": 33,
            "Jul": 25,
            "Aug": 28,
            "Sep": 30,
            "Oct": 35,
            "Nov": 38,
            "Dec": 32,
          }
        }
  }]});
    return Result.ok(sM);    
  }

  @override
  Future<Result<List<WorkCycleModel>>> getWorkCycles(int userId) async {
    return Future.value(Result.ok(dummyWorkCycles()));
  }

  @override
  Future<Result<List<WorkCycleModel>>> getWorkCyclesForDay(int userId, DateTime day) async {
    List<WorkCycleModel> wC = [];
    for (var wc in dummyWorkCycles()) {
      if (TimeUtils.dayWorkCycleOverlap(day, wc.startTime, wc.startTime)){
        wC.add(wc);
      }
    }
    return Future.value(Result.ok(wC));
  }

  @override
  Future<Result<StatisticsModel>> getStatisticsForDay(int userId, DateTime day) async {
    return await getStatistics(userId);
  }

  List<WorkCycleModel> dummyWorkCycles()  {
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