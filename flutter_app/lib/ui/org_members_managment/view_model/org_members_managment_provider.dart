import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model.dart';

class OrgMembersManagmentProvider with ChangeNotifier {
  late List<EmployeeBriefModel> employeeBriefModels;
  final TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  bool _isSearchActive = false;

  OrgMembersManagmentProvider() {
    initProvider();
  }

  Future<void> initProvider() async {
    await Future.delayed(Duration(milliseconds: 400));
    await initEmployees();
    isLoading = false;
    notifyListeners();
  }
  
  initEmployees() {
    Random random = Random();
    employeeBriefModels = [
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${90234234901}"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maroo", lastName: "Frankfurt", profilePictureUrl: "https://picsum.photos/200"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${3}", additionalInfo: "Here u can send info like 'is at work' or 'to be fired' etc."),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${4}"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt", profilePictureUrl: "https://thispersondoesnotexist.com/?${5}", additionalInfo: "At work or whatever"),
    ]..sort((a, b) => a.firstName.compareTo(b.position!));
  }

  bool get isSearchActive => _isSearchActive;

  void setSearchActive(bool value) {
    _isSearchActive = value;
    notifyListeners();
  }
}