import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/dependencies.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

class ProductionMain {
  static main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  
  runApp(MultiProvider(providers: productionProviders, child: MyApp()));
}
}
