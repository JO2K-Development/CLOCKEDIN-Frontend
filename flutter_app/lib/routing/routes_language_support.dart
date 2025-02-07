import 'package:flutter/material.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// This is for dynamically setting the pages

class LanguageSupportUtil {
  LanguageSupportUtil(); 

  Map<String, String> getRouteToCachedLocalizedText(BuildContext context) {
    // handles the event in which this provider is created above the
    // App localizations in the widget tree
    
    // this weird operator is null aware asignment
    _routeToLocalizedText ??= {
      Routes.calendar: AppLocalizations.of(context).calendar,
      Routes.clockInOut: AppLocalizations.of(context).clock_in,
      Routes.employeesManagement: AppLocalizations.of(context).company,
      Routes.employeeProfile: AppLocalizations.of(context).profile,
    };

    return _routeToLocalizedText!;
  }

  

  Map<String, String>? _routeToLocalizedText;

}