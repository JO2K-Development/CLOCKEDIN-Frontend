import 'package:flutter/material.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:provider/provider.dart';

class EmployeeProfileProvider with ChangeNotifier{
  late CurrentUserModel currentUser;
  late bool isLoading;

  EmployeeProfileProvider(context){
    this.isLoading = true;
    _load(context);
    this.isLoading = false;
  }
  
  void _load(context) {
  }
}