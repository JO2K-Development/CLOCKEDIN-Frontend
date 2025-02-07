import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import '../../../core/navigation/navigation_handler.dart';

abstract class UsersRepository {
  UsersRepository();
   

  Future<Result<CurrentUserModel>> getUser(int userId);

  Future<Result<StatisticsModel>> getStatistics(int userId);

  Future<Result<List<WorkCycleModel>>> getWorkCycles(int userId);

  Future<Result<List<WorkCycleModel>>> getWorkCyclesForDay(int userId, DateTime day);

  Future<Result<StatisticsModel>> getStatisticsForDay(int userId, DateTime day);

}