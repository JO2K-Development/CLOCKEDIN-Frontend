import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/current_user.dart';

import '../../domain/model_classes/app_init_user.dart';

class AppInitUserDataProvider with ChangeNotifier {
  CurrentUserModel? _appInitUserData;

  CurrentUserModel? get appInitUserData => _appInitUserData;

  AppInitUserDataProvider() {
    _appInitUserData = AppStateHandler.appPreparationUserData;
  }

}
