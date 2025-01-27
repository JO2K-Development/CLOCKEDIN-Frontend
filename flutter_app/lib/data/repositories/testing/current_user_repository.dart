import 'dart:convert';

import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import '../../../core/navigation/navigation_handler.dart';

class CurrentUserRepositoryTesting extends CurrentUserRepository {
  CurrentUserRepositoryTesting(
    {
      required LocalDataService localDataService,
    }
  ):
    _localDataService = localDataService;

  final LocalDataService _localDataService;

  CurrentUserModel? _currentUserCache;
  
  @override
  Future<bool> get isProfileFilled async {
      print("object1");
    try {
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
} on Exception catch (e) {
  print("obj ${e}");
}
return false;
  } 

  @override
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

  @override
  Future<Result<CurrentUserModel>> getCurrentUser({bool forceNetworkSolution=false})async {
      print("object1");

    if (_currentUserCache != null){
      return Result.ok(_currentUserCache!);
    }

    final Result<CurrentUserModel> result = await _localDataService.getCurrentUser();
    
    switch (result) {
      case Ok<CurrentUserModel>():
        _currentUserCache = result.value;

        await _localDataService.storeCurrentUser(result.value);
        return Future.value(result);
      case Error<CurrentUserModel>():
      print(result.error);
    }

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
    print("compare ${jsonDecode(exampleJson)}");
    final CurrentUserModel currentUser = CurrentUserModel.fromJson(jsonDecode(exampleJson));
    _currentUserCache = currentUser;
    await _localDataService.storeCurrentUser(currentUser);

    return Result.ok(currentUser);
  }

  @override
  Future<Result<List<WorkCycleModel>>> getWorkCycles({forceNetworkSolution=false}) async {
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