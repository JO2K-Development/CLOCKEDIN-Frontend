import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/common/org_members_managment/view/org_members_managment_page.dart';
import 'package:flutter_app/features/common/org_statistics/view/org_statistics.dart';
import 'package:flutter_app/features/main_admin/profile_and_organization/view/profile_and_organization_page.dart';
import 'package:flutter_app/features/emplyee/callendar/view/callendar_page.dart';
import 'package:flutter_app/features/emplyee/clock_in_out/view/clock_in_out_page.dart';
import 'package:flutter_app/features/emplyee/employee_profile/view/employee_profile_page.dart';

class ViewsShownByAccessId {
  static const dynamic viewsShownByAccessId = {
    "main_admin": [orgStatisticsPage(), OrgMembersManagmentPage(), ProfileAndOrganizationPage()],
    "employee": [CallendarPage(), ClockInOutPage(), EmployeeProfilePage()]
  };

  static List<Widget> getViewsByAccessId(List<String> accessIds) {
    String? mainAccesId = null;
    if (accessIds.contains('main_admin')) {
      mainAccesId = 'main_admin';
      accessIds.remove('main_admin');
    } else if (accessIds.contains('employee')) {
      mainAccesId = 'employee';
      accessIds.remove('employee');
    }
    if (mainAccesId == null) {
      return [];
    }
    return viewsShownByAccessId[mainAccesId];
  }
}