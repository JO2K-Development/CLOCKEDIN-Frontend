import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/auth_repository.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_app/ui/app_scaffold/view/app_scaffold.dart';
import 'package:flutter_app/ui/calendar/view/calendar_page.dart';
import 'package:flutter_app/ui/calendar/view_model/calendar_provider.dart';
import 'package:flutter_app/ui/clock_in_out/view/clock_in_out_page.dart';
import 'package:flutter_app/ui/clock_in_out/view_model/clock_in_out_provider.dart';
import 'package:flutter_app/ui/employee_profile/view/employee_profile_page.dart';
import 'package:flutter_app/ui/employee_profile/view_model/employee_profile_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(
  AuthRepository authRepository,
) => GoRouter(
  initialLocation: Routes.clockInOut,
  refreshListenable: authRepository,
  redirect: _redirect,

  routes: [
    // Home
    StatefulShellRoute.indexedStack(branches: 
    [
     StatefulShellBranch(
      routes: [
        GoRoute(
          path: Routes.clockInOut,
          pageBuilder: (context, state) => ClockInOutPage(
            viewModel: ClockInOutProvider(

            ),
          ) as Page<dynamic>,
        ),
      ]
     ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.calendar,
            pageBuilder: (context, state) => CalendarPage(
              viewModel: CalendarProvider(
                
              ),
            ) as Page<dynamic>,
          ),
        ],
      ),
      StatefulShellBranch(routes: [
        GoRoute(
          path: Routes.employeeProfile,
          pageBuilder: (context, state) => EmployeeProfilePage(
            viewModel: EmployeeProfileProvider(
              
            ),
          ) as Page<dynamic>,
        ),
      ]),
      ])
    ])

        
      ]
    ) 

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

