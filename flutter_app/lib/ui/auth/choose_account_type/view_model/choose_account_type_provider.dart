import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:flutter_app/domain/model_classes/company_invitation_model/company_invitation_model.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ChooseAccountTypeProvider with ChangeNotifier {
  ChooseAccountTypeProvider({
    required CurrentUserRepository currentUserRepository,
  }) : _currentUserRepository = currentUserRepository {
    joinCompany = Command1<void, int>(_joinCompany);
    load = Command0(_load)..execute();
  }

  final CurrentUserRepository _currentUserRepository;
  final List<CompanyInvitationModel> companyInvitations = [];
  XFile? imageFile;
  late Command1 joinCompany;
  late Command0 load;

  final _log = Logger();

  Future<Result<void>> _load() async {
    final result = await _currentUserRepository.getCompanyInvitations();
    switch (result) {
      case Ok<List<CompanyInvitationModel>>():
        companyInvitations.addAll(result.value);
        return Result.ok(null);
      case Error<List<CompanyInvitationModel>>():
        _log.e(result.error);
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _joinCompany(int companyId) async {
    final currentUserResult = await _currentUserRepository.currentUserModel;
    switch (currentUserResult) {
      case Ok<CurrentUserModel>():
        final result = await _currentUserRepository.updateCurrentUser(
            currentUserModel:
                currentUserResult.value.copyWith(companyId: companyId));
        switch (result) {
          case Ok<void>():
            // Handle success
            _log.i("Chosen company {companyId: $companyId} successfully");
            notifyListeners();

            return Result.ok(null);
          case Error<void>():
            // Handle error
            _log.e(result.error);
            notifyListeners();

            return Result.error(result.error);
        }

      case Error<CurrentUserModel>():
        notifyListeners();
        return Result.error(currentUserResult.error);
    }
  }
}
