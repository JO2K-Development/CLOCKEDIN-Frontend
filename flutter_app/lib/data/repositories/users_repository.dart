import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import '../../core/navigation/navigation_handler.dart';

class UsersRepository {
  UsersRepository(
    {
      required LocalDataService localDataService,
      required ApiClient apiClient,
    }
  ):
    _localDataService = localDataService,
    _apiClient = apiClient;

  final LocalDataService _localDataService;
  final ApiClient _apiClient;


  Future<Result<CurrentUserModel>> getUser(int id)async {
    final Result<UserApiModel?> serverStored = await _apiClient.getUser(id);
    switch (serverStored){
      case Ok<UserApiModel?>():
        CurrentUserModel user = CurrentUserModel.fromJson(serverStored.value!.toJson());
        return Result.ok(user);
      case Error<UserApiModel?>():
        return Result.error(serverStored.error);
    }
  }

  Future<Result<StatisticsModel>> getStatistics(int id)async {
    final Result<StatisticsModel> serverStored = await _apiClient.getStatisticsForUser(id);
    switch (serverStored){
      case Ok<StatisticsModel>():
        return serverStored;
      case Error<StatisticsModel>():
        return Result.error(serverStored.error);
    }
  }
}