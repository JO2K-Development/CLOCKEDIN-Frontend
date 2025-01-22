import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/current_user_repository.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:provider/provider.dart';

class EmployeeProfileProvider with ChangeNotifier{
  CurrentUserModel? currentUser;
  late bool isLoading;
  late Command0 load;

  EmployeeProfileProvider({
    required CurrentUserRepository currentUserRepository,
  }) : _currentUserRepository = currentUserRepository
  {
    load = Command0(_load)..execute();
  }

  final CurrentUserRepository _currentUserRepository;

  
  Future<Result> _load() async {
    try {
      final Result<CurrentUserModel> result = await _currentUserRepository.getCurrentUser();
      switch (result) {
        case Ok<CurrentUserModel>():
          currentUser = result.value;
          return result;
        case Error<CurrentUserModel>():
          return result;
      }
    } finally {
      notifyListeners();
    }
  }
}