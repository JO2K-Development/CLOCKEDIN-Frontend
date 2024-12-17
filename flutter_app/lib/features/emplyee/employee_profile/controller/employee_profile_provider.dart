import 'package:flutter/material.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:provider/provider.dart';

class EmployeeProfileProvider with ChangeNotifier{
  late String employeeName;
  late bool isLoading;

  EmployeeProfileProvider(context){
    this.isLoading = true;
    initProvider(context);
    this.isLoading = false;
  }
  
  void initProvider(context) {
    employeeName = "${Provider.of<AppInitUserDataProvider>(context, listen: false).appInitUserData!.firstName!} ${Provider.of<AppInitUserDataProvider>(context, listen: false).appInitUserData!.lastName!}"; 
  }
}