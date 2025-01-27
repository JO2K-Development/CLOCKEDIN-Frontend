import 'dart:math';

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

class ManagementRepositoryTesting extends ManagementRepository {
  ManagementRepositoryTesting({
    required LocalDataService localDataService,
  }) : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<EmployeeBriefModel>>> getManagedUsers(
      {forceInternetResolution = false}) async {
    final Result<CurrentUserModel> currUser = await _localDataService.getCurrentUser();
    if (currUser is Ok<CurrentUserModel>){

      int? c_u_company_id = currUser.value.companyId;
    } else {
      return Result.error(Exception("Fucking hell"));
    }
    var positions = ["Junior Dev", "Senior Dev", "Child", null];
    Random random = new Random();
    
    List<EmployeeBriefModel> users = List.generate(30, (index) => EmployeeBriefModel(id: index, companyId: currUser.value.companyId! , position: positions[random.nextInt(4)], firstName: "User", lastName: "${index}", 
    additionalInfo: (index % 4 == 0 ? "Here Some additional info" : null), managerId: currUser.value.id, profilePictureUrl: "https://thispersondoesnotexist.com/?${random.nextInt(1000000000)}"));
    return Result.ok(users);
  }
}
