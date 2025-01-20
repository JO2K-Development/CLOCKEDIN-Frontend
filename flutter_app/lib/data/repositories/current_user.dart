import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import '../../core/navigation/navigation_handler.dart';

class CurrentUserRepository {
  CurrentUserRepository(
    {
      required LocalDataService localDataService,
      required ApiClient apiClient,
    }
  ):
    _localDataService = localDataService,
    _apiClient = apiClient;

  final LocalDataService _localDataService;
  final ApiClient _apiClient;

  CurrentUserModel? _currentUserCache;

  Future<Result<CurrentUserModel>> getCurrentUser()async {
    if (_currentUserCache != null) {
      return Future.value(Result.ok(_currentUserCache!));
    } 

    final Result<UserApiModel?> locallyStored = await _localDataService.getMainUserJson();
    switch (locallyStored){
      case Ok<UserApiModel?>():
        CurrentUserModel user = CurrentUserModel.fromJson(locallyStored.value!.toJson());
        _currentUserCache = user;
        return Result.ok(user);
      case Error<UserApiModel?>():
        break;
        // we want to try to get the user from the server
        // return Result.error(locallyStored.error);
    }

    final Result<UserApiModel?> serverStored = await _apiClient.getCurrentUser();
    switch (serverStored){
      case Ok<UserApiModel?>():
        CurrentUserModel user = CurrentUserModel.fromJson(serverStored.value!.toJson());
        _currentUserCache = user;
        return Result.ok(user);
      case Error<UserApiModel?>():
        return Result.error(serverStored.error);
    }
  }
}