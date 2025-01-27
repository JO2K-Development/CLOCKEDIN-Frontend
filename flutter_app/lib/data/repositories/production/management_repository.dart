import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/management_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model/employee_brief_model.dart';
import 'package:flutter_app/domain/model_classes/statistics_model/statistics_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import '../../../core/navigation/navigation_handler.dart';

class ManagementRepositoryProduction extends ManagementRepository {
  ManagementRepositoryProduction({
    required LocalDataService localDataService,
    required ApiClient apiClient,
  })  : _localDataService = localDataService,
        _apiClient = apiClient;

  final LocalDataService _localDataService;
  final ApiClient _apiClient;

  @override
  Future<Result<List<EmployeeBriefModel>>> getManagedUsers({forceInternetResolution = false}) async {
    // Might be solved also by joining multiple server queries
    //TODO: probably need a lot of improvements
    final result = await _localDataService.getManagedUsers();
    switch (result) {
      case Ok<List<EmployeeBriefModel>>():
        return result;
      case Error<List<EmployeeBriefModel>>():
    }
    Result<CurrentUserModel> currentUser;
    if (!forceInternetResolution) {
      currentUser = await _localDataService.getCurrentUser();

      if (currentUser is Error<CurrentUserModel>) {
        //TODO: should we assume logout at this point or get the data from WEB?
        currentUser = await _apiClient.getCurrentUser();
      }
    } else {
      currentUser = await _apiClient.getCurrentUser();
    }
    if (currentUser is Ok<CurrentUserModel>) {
      final Result<List<EmployeeBriefModel>> serverStored =
          await _apiClient.getManagedUsers(currentUser.value.id);

      switch (serverStored) {
        case Ok<List<EmployeeBriefModel>>():
          _localDataService.storeManagedUsers(serverStored.value);
          return Result.ok(serverStored.value);
        case Error<List<EmployeeBriefModel>>():
          return Result.error(serverStored.error);
      }
    } else {
      return Result.error(Exception("No current user found"));
    }
  }
}
