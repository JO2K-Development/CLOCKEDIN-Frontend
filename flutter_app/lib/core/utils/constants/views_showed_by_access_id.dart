import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/enums/access_identifiers.dart';
import 'package:flutter_app/features/common/org_members_managment/view/org_members_managment_page.dart';
import 'package:flutter_app/features/common/org_statistics/view/org_statistics.dart';
import 'package:flutter_app/features/main_admin/profile_and_organization/view/profile_and_organization_page.dart';
import 'package:flutter_app/features/emplyee/calendar/view/calendar_page.dart';
import 'package:flutter_app/features/common/clock_in_out/view/clock_in_out_page.dart';
import 'package:flutter_app/features/emplyee/employee_profile/view/employee_profile_page.dart';
import 'package:provider/provider.dart';

class ViewsShownByAccessId {
  static const dynamic viewsShownByAccessId = {
    AccessIdentifier.admin : [orgStatisticsPage(), OrgMembersManagmentPage(), ProfileAndOrganizationPage()],
    AccessIdentifier.employee : [CalendarPage(), ClockInOutPage(), EmployeeProfilePage()]
  };

  static List<Widget> getViewsByAccessId(List<AccessIdentifier> accessIds) {
    AccessIdentifier? mainAccesId;
    if (accessIds.contains(AccessIdentifier.admin)) {
      
      mainAccesId = AccessIdentifier.admin;
      accessIds.remove(AccessIdentifier.admin);
    } else if (accessIds.contains(AccessIdentifier.employee)) {
      
      mainAccesId = AccessIdentifier.employee;
      accessIds.remove(AccessIdentifier.employee);
    }
    if (mainAccesId == null) {
      return [];
    }
    return viewsShownByAccessId[mainAccesId];
  }
}