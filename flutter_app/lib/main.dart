import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/navigation/navigation_handler.dart';
import 'package:flutter_app/core/utils/theme/my_theme.dart';
import 'package:flutter_app/ui/app_scaffold/view/landing_page.dart';
import 'package:flutter_app/ui/auth/data_filling/view/data_filling_page.dart';
import 'package:flutter_app/ui/auth/initial_login/view_model/initial_login.dart';
import 'package:flutter_app/ui/auth/initial_login/view/initial_login.dart';
import 'package:flutter_app/ui/auth/register/view_model/register.dart';
import 'package:flutter_app/ui/auth/register/view/register.dart';
import 'package:flutter_app/ui/employees_management/view_model/employees_managment.dart';
import 'package:flutter_app/ui/calendar/view_model/calendar_provider.dart';
import 'package:flutter_app/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  
  String initRoute = await NavigationHandler.prepareInitialAppState();
  // String initRoute = "/initial-login";
  // String initRoute = "/register";
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
        ChangeNotifierProvider(create: (context) => CalendarProvider()),
        ChangeNotifierProvider(create: (context) => OrgMembersManagmentProvider())
        // ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MaterialApp(
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          locale: L10n.all[0],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: NavigationHandler.navigatorKey,
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
          }),
    );
  }
}
