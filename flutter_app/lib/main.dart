import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/config/dependencies.dart';
import 'package:flutter_app/core/navigation/navigation_handler.dart';
import 'package:flutter_app/core/theme/my_theme.dart';
import 'package:flutter_app/data/repositories/auth_repository.dart';
import 'package:flutter_app/routing/router.dart';
import 'package:flutter_app/ui/app_scaffold/view/app_scaffold.dart';
import 'package:flutter_app/ui/auth/data_filling/view/data_filling_page.dart';
import 'package:flutter_app/ui/auth/initial_login/view_model/initial_login_provider.dart';
import 'package:flutter_app/ui/auth/initial_login/view/initial_login_page.dart';
import 'package:flutter_app/ui/auth/register/view_model/register_provider.dart';
import 'package:flutter_app/ui/auth/register/view/register_page.dart';
import 'package:flutter_app/ui/employees_management/view_model/employees_managment.dart';
import 'package:flutter_app/ui/calendar/view_model/calendar_provider.dart';
import 'package:flutter_app/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
          // navigatorKey: NavigationHandler.navigatorKey,
          title: 'CLOCKED-IN',
          themeMode: ThemeMode.system,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          routerConfig: router(
            // context.read()
          ),
    );
  }
}
