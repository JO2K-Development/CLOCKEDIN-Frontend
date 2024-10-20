import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/app_state_handler.dart';

import '../models/app_init_user_model.dart';

class AppInitUserDataProvider with ChangeNotifier {
  AppInitUserModel? _appInitUserData;

  AppInitUserModel? get appInitUserData => _appInitUserData;

  AppInitUserDataProvider() {
    _appInitUserData = AppStateHandler.appPreparationUserData;
  }

}
