import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/services/navigation_service.dart';
import 'package:flutter_app/core/utils/theme/my_theme.dart';
import 'package:flutter_app/features/common/landing/view/LandingPage.dart';
import 'package:flutter_app/features/login/data_filling/view/data_filling_page.dart';
import 'package:flutter_app/features/login/initial_login/controller/initial_login_provider.dart';
import 'package:flutter_app/features/login/initial_login/view/initial_login_page.dart';
import 'package:flutter_app/features/login/register/controller/register_provider.dart';
import 'package:flutter_app/features/login/register/view/register_page.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  // String initRoute = await NavigationService.prepareInitialAppState();
  String initRoute = "/register";
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
        themeMode: ThemeMode.system,
        darkTheme: MyTheme.darkTheme,
        theme: MyTheme.lightTheme,
        initialRoute: initialRoute,
        routes: {
          '/initial-login': (context) => ChangeNotifierProvider(
            create: (context) => InitialLoginProvider(),
            child: InitialLoginPage(),
          ),
          '/register': (context) => ChangeNotifierProvider(
            create: (context) => RegisterProvider(),
            child: RegisterPage(),
          ),
          '/data-fill': (context) => DataFillingPage(),
          '/landing': (context) => LandingPage(),
        }
         
      ),
    );
  }
}
