import 'dart:convert';

import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/company_invitation_model/company_invitation_model.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/navigation/navigation_handler.dart';

class CurrentUserRepositoryProduction extends CurrentUserRepository {
  CurrentUserRepositoryProduction(
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
  List<WorkCycleModel>? _usersWorkCyclesCache;
  
  Future<Result<int>> get currentUserId async => await getCurrentUser().then((value) {
    switch (value) {
      case Ok<CurrentUserModel>():
        return Result.ok(value.value.id);
      case Error<CurrentUserModel>():
        return Result.error(value.error);
    }
    
  });

    @override
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
  Future<Result<CurrentUserModel>> get currentUserModel async {
    if (_currentUserCache != null) {
      return Result.ok(_currentUserCache!);
    } else {
      return getCurrentUser();
    }
  }

  @override
  Future<Result<void>> fillData({required String firstName, required String lastName, XFile? profileImage}) async {
    final Result<CurrentUserModel> getResult = await getCurrentUser();
    switch (getResult) {
      case Ok<CurrentUserModel>():
        CurrentUserModel user = getResult.value.copyWith(firstName: firstName, lastName: lastName);
        final Result<void> updResult = await _apiClient.updateCurrentUser(user);
        switch (updResult) {
          case Ok<void>():
            _currentUserCache = user;
            _localDataService.storeCurrentUser(user);
            return Result.ok(null);
          case Error<void>():
            return Result.error(updResult.error);
        }
      case Error<CurrentUserModel>():
        return Result.error(getResult.error);
    }
  }

  @override
  Future<Result<void>> updateCurrentUser({required CurrentUserModel currentUserModel}) async {
    final Result<void> result = await _apiClient.updateCurrentUser(currentUserModel);
    switch (result) {
      case Ok<void>():
        _currentUserCache = currentUserModel;
        _localDataService.storeCurrentUser(currentUserModel);
        return Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<CompanyInvitationModel>>> getCompanyInvitations() async {
    final Result<List<CompanyInvitationModel>> result = await _apiClient.getCurrentUserCompanyInvitations();
    switch (result) {
      case Ok<List<CompanyInvitationModel>>():
        return Result.ok(result.value);
      case Error<List<CompanyInvitationModel>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<CurrentUserModel>> getCurrentUser({bool forceNetworkSolution=false})async {
    if (!forceNetworkSolution) {

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

  @override
  Future<Result<List<WorkCycleModel>>> getWorkCycles({forceNetworkSolution=false}) async {
    //TODO: implement getWorkCycles
    // they should be sorted and be like a short list of some
    if (!forceNetworkSolution) {
      if (_usersWorkCyclesCache != null){
        return Result.ok(_usersWorkCyclesCache!);
      }
      //TODO: danger of data overflow
      Result<List<WorkCycleModel>> locallyStored = await _localDataService.getCurrentUsersWorkcycles();
      switch (locallyStored) {
        case Ok<List<WorkCycleModel>>():
          _usersWorkCyclesCache = locallyStored.value;
          return locallyStored;
        case Error<List<WorkCycleModel>>():

      }
    }
    // Network part
    final userIdResult = await currentUserId;
    switch (userIdResult) {
      case Ok<int>():
        Result<List<WorkCycleModel>> serverFetched = await _apiClient.getWorkCyclesForUser(userIdResult.value);
        switch (serverFetched) {
          case Ok<List<WorkCycleModel>>():
            _usersWorkCyclesCache = serverFetched.value;
            _localDataService.storeCurrentUserWorkCycles(serverFetched.value);
            return Result.ok(serverFetched.value);
          case Error<List<WorkCycleModel>>():
            return Result.error(serverFetched.error);
        }
      case Error<int>():
        return Result.error(userIdResult.error);

    }

    
  }
}