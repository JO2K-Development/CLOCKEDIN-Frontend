import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/dependencies.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class ProductionMain {
  static main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await ProductionMain.discardStorage();
  runApp(MultiProvider(providers: productionProviders, child: MyApp()));
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
