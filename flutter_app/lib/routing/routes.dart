import 'package:flutter/material.dart';

final class Routes {
  static const String initialLogin = "/initial-login";
  static const String register = "/register";
  static const String dataFilling = "/data-filling";
  static const String calendar = "/calendar";
  static const String employeeManagement = "/employee-management";
  static const String employeesManagement = "/employees-management";

  static const String clockInOut = "/clock-in-out";
  static const String employeeProfile = "/employee-profile";
  static const String companyStatistics = "/company-statistics";
  static const String dayOfWork = "/day-of-work";
  static const String chooseAccountType = "/choose-account-type";

  static const Map<String, IconData> routesIcons = {
    calendar: Icons.calendar_month,
    clockInOut: Icons.watch,
    employeeProfile: Icons.person,
    companyStatistics: Icons.bar_chart,
    employeesManagement: Icons.people,
    dayOfWork: Icons.work,
    chooseAccountType: Icons.business,
  };
}

