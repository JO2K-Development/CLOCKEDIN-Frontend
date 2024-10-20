import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/services/navigation_service.dart';
import 'package:flutter_app/features/common/landing/view/LandingPage.dart';
import 'package:flutter_app/features/login/initial_login/view/initial_login_page.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  String initRoute = await NavigationService.prepareInitialAppState();
  // String initRoute = "/landing";
  runApp(MyApp(initRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  
  const MyApp(this.initialRoute, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ...()),
        ChangeNotifierProvider(create: (context) => AppInitUserDataProvider()),
        // ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CLOCKED-IN',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        routes: {
          '/initial-login': (context) => InitialLoginPage(),
          '/data-fill': (context) => InitialLoginPage(),
          '/landing': (context) => LandingPage(),
        }
         
      ),
    );
  }
}
