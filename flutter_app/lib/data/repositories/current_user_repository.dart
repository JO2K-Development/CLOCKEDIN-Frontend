import 'dart:convert';

import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
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
  
  Future<bool> get isProfileFilled async {
    if (_currentUserCache != null) {
      return Future.value(CurrentUserModel.isProfileFilled(_currentUserCache!));
    } else {
      final Result<CurrentUserModel> result = await getCurrentUser();
      switch (result){
        case Ok<CurrentUserModel>():
          return CurrentUserModel.isProfileFilled(result.value);
        case Error<CurrentUserModel>():
          return false;
      }
    }
  } 

  Future<bool> get isCompanyChosen async {
    if (_currentUserCache != null) {
      return Future.value(_currentUserCache!.companyId != null);
    } else {
      final Result<CurrentUserModel> result = await getCurrentUser();
      switch (result){
        case Ok<CurrentUserModel>():
        _currentUserCache = result.value;
          return _currentUserCache!.companyId != null;
        case Error<CurrentUserModel>():
          return false;
      }
    }
  }

  Future<Result<CurrentUserModel>> getCurrentUser()async {
    String exampleJson = '''
  {
     "id": 1,
     "company_id": 123,
     "position": "Developer",
     "first_name": "Johnissimo",
     "last_name": "Doe",
     "email": "john.doe@example.com",
     "manager_id": 456,
     "profile_picture_url": "https://picsum.photos/200",
     "access_identifiers": ["employee"]
   }
   ''';

    return Result.ok(CurrentUserModel.fromJson(jsonDecode(exampleJson)));
    
    if (_currentUserCache != null) {
      return Future.value(Result.ok(_currentUserCache!));
    } 

    final Result<CurrentUserModel> locallyStored = await _localDataService.getCurrentUser();
    switch (locallyStored){
      case Ok<CurrentUserModel>():
        CurrentUserModel user = CurrentUserModel.fromJson(locallyStored.value.toJson());
        _currentUserCache = user;
        return Result.ok(user);
      case Error<CurrentUserModel>():
        break;
        // we want to try to get the user from the server
        // return Result.error(locallyStored.error);
    }

    final Result<CurrentUserModel> serverStored = await _apiClient.getCurrentUser();
    switch (serverStored){
      case Ok<CurrentUserModel>():
        CurrentUserModel user = CurrentUserModel.fromJson(serverStored.value.toJson());
        _currentUserCache = user;
        return Result.ok(user);
      case Error<CurrentUserModel>():
        return Result.error(serverStored.error);
    }
  }

  Future<Result<List<WorkCycleModel>>> getWorkCycles() async {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    List<WorkCycleModel> list =  [
      WorkCycleModel(
          id: 1,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.remoteWork),
      WorkCycleModel(
          id: 2,
          startTime: DateTime.now(),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.approvedByLocation),
      WorkCycleModel(
          id: 3,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.approvedByManager),
      WorkCycleModel(
          id: 3,
          startTime: DateTime(1400, 1, 1, 0, 0),
          endTime: DateTime(1400, 1, 1, 0, 0),
          type: WorkCycleType.approvedByQr),
    ];
    return Result.ok(list);
  }
}