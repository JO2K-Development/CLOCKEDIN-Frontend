import 'package:flutter/material.dart';
import 'package:flutter_app/features/common/org_members_managment/model/employee_brief_model.dart';

class OrgMembersManagmentProvider with ChangeNotifier {
  late List<EmployeeBriefModel> employeeBriefModels;
  bool isLoading = true;

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
    employeeBriefModels = [
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maroo", lastName: "Frankfurt"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Senior Chad", firstName: "Maciek", lastName: "Frankfurt"),
      EmployeeBriefModel(id: 123, companyId: 21, position: "Developer", firstName: "Maciek", lastName: "Frankfurt"),
    ];
  }
}