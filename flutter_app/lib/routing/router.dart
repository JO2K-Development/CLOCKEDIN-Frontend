import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/auth_repository.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_app/ui/app_scaffold/view/app_scaffold.dart';
import 'package:flutter_app/ui/auth/initial_login/view/initial_login.dart';
import 'package:flutter_app/ui/auth/initial_login/view_model/initial_login.dart';
import 'package:flutter_app/ui/calendar/view/calendar_page.dart';
import 'package:flutter_app/ui/calendar/view_model/calendar_provider.dart';
import 'package:flutter_app/ui/clock_in_out/view/clock_in_out_page.dart';
import 'package:flutter_app/ui/clock_in_out/view_model/clock_in_out_provider.dart';
import 'package:flutter_app/ui/employee_profile/view/employee_profile_page.dart';
import 'package:flutter_app/ui/employee_profile/view_model/employee_profile_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(
  // AuthRepository authRepository,
) => GoRouter(
  initialLocation: Routes.employeeProfile,
  // refreshListenable: authRepository,
  // redirect: _redirect,

  routes: [
    GoRoute(
      path: Routes.initialLogin,
      builder: (context, state) => InitialLoginPage(),
      ),
    // Home
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => BottomBarShell(
        child: child!,
      ),
      branches: 
    [
     StatefulShellBranch(
      routes: [
        GoRoute(
          path: Routes.clockInOut,
          builder: (context, state) => ClockInOutPage(
            viewModel: ClockInOutProvider(
              
            ),
          ),
        ),
      ]
     ),
      StatefulShellBranch(
        routes: [
          GoRoute(
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
          ),
        ],
      ),
      StatefulShellBranch(routes: [
        GoRoute(
          path: Routes.employeeProfile,
          builder: (context, state) => EmployeeProfilePage(
            viewModel: EmployeeProfileProvider(
              currentUserRepository: context.read(),
            ),
          ),
        ),
      ]),
      ])
    ]);

  

    // From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.initialLogin;
  if (!loggedIn) {
    return Routes.initialLogin;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.clockInOut;
  }

  // no need to redirect at all
  return null;
}

