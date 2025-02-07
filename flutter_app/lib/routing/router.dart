import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_app/ui/app_scaffold/view/app_scaffold.dart';
import 'package:flutter_app/ui/auth/choose_account_type/view/choose_account_type_page.dart';
import 'package:flutter_app/ui/auth/choose_account_type/view_model/choose_account_type_provider.dart';
import 'package:flutter_app/ui/auth/data_filling/view/data_filling_page.dart';
import 'package:flutter_app/ui/auth/data_filling/view_model/data_filling_provider.dart';
import 'package:flutter_app/ui/auth/initial_login/view/initial_login_page.dart';
import 'package:flutter_app/ui/auth/initial_login/view_model/initial_login_provider.dart';
import 'package:flutter_app/ui/auth/register/view/register_page.dart';
import 'package:flutter_app/ui/auth/register/view_model/register_provider.dart';
import 'package:flutter_app/ui/calendar/view/calendar_page.dart';
import 'package:flutter_app/ui/calendar/view_model/calendar_provider.dart';
import 'package:flutter_app/ui/clock_in_out/view/clock_in_out_page.dart';
import 'package:flutter_app/ui/clock_in_out/view_model/clock_in_out_provider.dart';
import 'package:flutter_app/ui/day_of_work/view/day_of_work_page.dart';
import 'package:flutter_app/ui/day_of_work/view_model/day_of_work_provider.dart';
import 'package:flutter_app/ui/employee_profile/view/employee_profile_page.dart';
import 'package:flutter_app/ui/employee_profile/view_model/employee_profile_provider.dart';
import 'package:flutter_app/ui/employees_management/view/employees_managment.dart';
import 'package:flutter_app/ui/employees_management/view_model/employees_managment.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';


GoRouter router(
  AuthRepository authRepository,
) {
  
  return GoRouter(
  initialLocation: AliasedRoutes.appScaffoldFeatures[0].path,
  refreshListenable: authRepository,
  redirect: _redirect,

  routes: [
    AliasedRoutes.dayOfWeek,
    
    ...AliasedRoutes.authFeatures,
    
    //This takes care of adding the features in a parametric way
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => AppScaffolding(
        languageSupportUtil: context.read(),
        child: child,
      ),
      branches: List.generate(AliasedRoutes.appScaffoldFeatures.length, 
        (index) => StatefulShellBranch(routes: [
          AliasedRoutes.appScaffoldFeatures[index]
        ]))

      ),
    ]);
}

  

    // From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login 
  final _log = Logger();
  _log.i("Redirecting user");
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;


  // handles situations when the user is in the auth layer
  if ([AliasedRoutes.initLogin, AliasedRoutes.registerPage].any((el) => el.path == state.matchedLocation)){
    if (loggedIn){
      return AliasedRoutes.appScaffoldFeatures[1].path;
    }
    return null;
  }

  // handles not logged in
  if (!loggedIn) {
    return Routes.initialLogin;
  }

  final profileFilled = await context.read<CurrentUserRepository>().isProfileFilled;

  // handles incomplete user profile
  if (!profileFilled) {
    return Routes.dataFilling;
  }

  final chosenCompany = await context.read<CurrentUserRepository>().isCompanyChosen;

  // handles not chosen company
  if (!chosenCompany) {
    return Routes.chooseAccountType;
  }

  // if the user is logged in but still in the auth layer of the pages, send them to
  // the home page
  final inAuthLayerPages = AliasedRoutes.authFeatures.any((route) => state.matchedLocation == route);
  if (inAuthLayerPages) {
    return Routes.clockInOut;
  }

  // no need to redirect at all
  return null;
}


class AliasedRoutes {
  AliasedRoutes._();

  // could have a dict<string name, GoRoute route> and a conf/downloaded file
  // would list the names of the available features (which are expansion of the 
  // basic routes group)

  static GoRoute employeesManagement = GoRoute(
      path: Routes.employeesManagement,
      builder: (context, state) => EmployeesManagmentPage(
        viewModel: EmployeesManagmentProvider(
          managmentRepository: context.read()
          ) 
        ));
  
  static GoRoute clockInOut = GoRoute(
          path: Routes.clockInOut,
          builder: (context, state) => ClockInOutPage(
            viewModel: ClockInOutProvider(
              currentUserRepository: context.read()
            ),
          ),
        );

  static GoRoute calendar = GoRoute(
            // path: ":id",
            path: Routes.calendar,
            builder: (context, state) { 

            // final int id = int.parse(state.pathParameters["id"]!);
            final CalendarProvider viewModel = CalendarProvider(
                usersRepository: context.read(),
                // userId: id,
              );

            viewModel.load.execute();

            return CalendarPage(
              viewModel: viewModel,
            );}
          );
  static GoRoute employeeProfile = GoRoute(
          path: Routes.employeeProfile,
          builder: (context, state) => EmployeeProfilePage(
            viewModel: EmployeeProfileProvider(
              currentUserRepository: context.read(),
            ),
          ),
        );
  
  static GoRoute dayOfWeek = GoRoute(
      path: "${Routes.dayOfWork}/:date", 
      builder: (context, state) {
      final DateTime date = DateTime.parse(state.pathParameters["date"]!);
      final DayOfWorkProvider viewModel = DayOfWorkProvider(
        usersRepository: context.read(),
        day: date,
      );
      viewModel.load.execute();
      return DayOfWorkPage(
        viewModel: viewModel,);
          });

          
  static GoRoute initLogin = GoRoute(
      path: Routes.initialLogin,
      builder: (context, state) => InitialLoginPage(
        viewModel: InitialLoginProvider(
          authRepository: context.read(),
        ),
      ),
      );
  static GoRoute registerPage = GoRoute(
      path: Routes.register,
      builder: (context, state) => RegisterPage(
        viewModel: RegisterProvider(
          authRepository: context.read(),
        ),
      ),
    );
   static GoRoute dataFilling = GoRoute(
      path: Routes.dataFilling,
      builder: (context, state) => DataFillingPage(
        viewModel: DatafillingProvider(
          currentUserRepository: context.read(),
        ),
      ),
    );
  static GoRoute chooseAccountType = GoRoute(
      path: Routes.chooseAccountType,
      builder: (context, state) => ChooseAccountTypePage(
        viewModel: ChooseAccountTypeProvider(
          currentUserRepository: context.read(),
        ),
      ),
    );
  static List<GoRoute> appScaffoldFeatures = [
    employeesManagement,
    clockInOut,
    calendar,
    employeeProfile,
  ];

  static final String landingPage = appScaffoldFeatures[1].path;

  static List<GoRoute> authFeatures = [
    initLogin,
    registerPage,
    dataFilling,
    chooseAccountType,
  ];
  
}

