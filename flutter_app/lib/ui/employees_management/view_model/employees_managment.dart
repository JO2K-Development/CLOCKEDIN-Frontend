import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model/employee_brief_model.dart';
import 'package:flutter_app/data/repositories/management_repository.dart';
class EmployeesManagmentProvider with ChangeNotifier {
  List<EmployeeBriefModel>? employeeBriefModels;
  final TextEditingController searchController = TextEditingController();
  bool _isSearchActive = false;

  EmployeesManagmentProvider({
    required ManagementRepository managmentRepository,
  }) : _managmentRepository = managmentRepository 
  {
    load = Command0(_load)..execute();
  }

  final ManagementRepository _managmentRepository;
  late Command0 load;

  Future<Result<void>> _load() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final result = await _managmentRepository.getManagedUsers();
      print(result);
      switch (result) {
        case Ok<List<EmployeeBriefModel>>():
          employeeBriefModels = result.value;
          return Result.ok(null);
        case Error<List<EmployeeBriefModel>>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  bool get isSearchActive => _isSearchActive;

  void setSearchActive(bool value) {
    _isSearchActive = value;
    notifyListeners();
  }
}