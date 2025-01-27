import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/dependencies.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/testing/current_user_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class DevMain {
  static main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  var providers = testingProviders;
  await DevMain.discardStorage();
  // await DevMain.setLevelToLoggedIn();
  runApp(MultiProvider(providers: productionProviders, child: MyApp()));
}

static Future<void> setLevelToLoggedIn() async {
  var s = LocalDataService();
  var rep = CurrentUserRepositoryTesting(localDataService: s);

  try {
    var u = await rep.getCurrentUser();
    var tokens = s.storeAuthTokens('accessDummy', 'refreshDummy');
    switch (tokens) {
      case Ok<void>():
        print("level set to logged in");
        break;
      default:
        print("failed to set level to logged in");
    }
  } catch (e) {
    print("Error in setting level to logged in ${e}");
  }
}

static Future<void> discardStorage() async {
    var s = LocalDataService();
  try {
    var r = await s.discardAll();
      switch (r) {
    case Ok<void>():
      print("discarded successfully");
    default:
      print("failed to discard");
  }

  } catch (e) {
    print("Error in discarding ${e}");
  }
}
}
