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

class UsersRepositoryProduction extends UsersRepository {
  UsersRepositoryProduction(
    {
      required LocalDataService localDataService,
      required ApiClient apiClient,
    }
  ):
    _localDataService = localDataService,
    _apiClient = apiClient;

  final LocalDataService _localDataService;
  final ApiClient _apiClient;

  @override
  Future<Result<CurrentUserModel>> getUser(int userId)async {
    final Result<CurrentUserModel> serverStored = await _apiClient.getUser(userId);
    switch (serverStored){
      case Ok<CurrentUserModel>():
        CurrentUserModel user = CurrentUserModel.fromJson(serverStored.value!.toJson());
        return Result.ok(user);
      case Error<CurrentUserModel>():
        return Result.error(serverStored.error);
    }
  }

  @override
  Future<Result<StatisticsModel>> getStatistics(int userId) async {
    final Result<StatisticsModel> serverStored = await _apiClient.getStatisticsForUser(userId);
    
    switch (serverStored){
      case Ok<StatisticsModel>():
        return serverStored;
      case Error<StatisticsModel>():
        return Result.error(serverStored.error);
    }
  }

  @override
  Future<Result<List<WorkCycleModel>>> getWorkCycles(int userId) async {
    final Result<List<WorkCycleModel>> serverStored = await _apiClient.getWorkCyclesForUser(userId);
    switch (serverStored){
      case Ok<List<WorkCycleModel>>():
        return serverStored;
      case Error<List<WorkCycleModel>>():
        return Result.error(serverStored.error);
    }
  }

  @override
  Future<Result<List<WorkCycleModel>>> getWorkCyclesForDay(int userId, DateTime day) async {
    final Result<List<WorkCycleModel>> serverStored = await _apiClient.getWorkCyclesForUser(userId);
    switch (serverStored){
      case Ok<List<WorkCycleModel>>():
        return Result.ok(WorkCycleModel.filterEventsForDay(serverStored.value, day));
      case Error<List<WorkCycleModel>>():
        return Result.error(serverStored.error);
    }
  }

  @override
  Future<Result<StatisticsModel>> getStatisticsForDay(int userId, DateTime day) async {
    final Result<StatisticsModel> serverStored = await _apiClient.getStatisticsForUser(userId);
    switch (serverStored){
      case Ok<StatisticsModel>():
        return Result.ok(serverStored.value);
      case Error<StatisticsModel>():
        return Result.error(serverStored.error);
    }
  }

}