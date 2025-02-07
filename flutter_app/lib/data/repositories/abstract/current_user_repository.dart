import 'dart:convert';

import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/user_api_model/user_api_model.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:flutter_app/domain/model_classes/company_invitation_model/company_invitation_model.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:flutter_app/domain/model_classes/work_cycle_model/work_cycle_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/navigation/navigation_handler.dart';

abstract class CurrentUserRepository {
  CurrentUserRepository();
  
  Future<Result<CurrentUserModel>> get currentUserModel;

  Future<bool> get isProfileFilled;

  Future<bool> get isCompanyChosen;

  Future<Result<List<CompanyInvitationModel>>> getCompanyInvitations();

  Future<Result<void>> fillData({required String firstName, required String lastName, XFile? profileImage});

  Future<Result<void>> updateCurrentUser({required CurrentUserModel currentUserModel});

  Future<Result<CurrentUserModel>> getCurrentUser({bool forceNetworkSolution=false});

  Future<Result<List<WorkCycleModel>>> getWorkCycles({forceNetworkSolution=false});
}