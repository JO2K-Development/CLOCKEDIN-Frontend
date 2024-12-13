import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/services/navigation_service.dart';
import 'package:flutter_app/core/utils/theme/my_theme.dart';
import 'package:flutter_app/features/common/landing/view/landing_page.dart';
import 'package:flutter_app/features/auth/data_filling/view/data_filling_page.dart';
import 'package:flutter_app/features/auth/initial_login/controller/initial_login_provider.dart';
import 'package:flutter_app/features/auth/initial_login/view/initial_login_page.dart';
import 'package:flutter_app/features/auth/register/controller/register_provider.dart';
import 'package:flutter_app/features/auth/register/view/register_page.dart';
import 'package:flutter_app/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  // String initRoute = await NavigationService.prepareInitialAppState();
  // String initRoute = "/initial-login";
  // String initRoute = "/register";
  String initRoute = "/landing";

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
          supportedLocales: L10n.all,
          locale: L10n.all[0],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: NavigationService.navigatorKey,
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
