import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


enum WorkCycleType {
  //TODO:
  remoteWork,
  approvedByManager,
  approvedByQr,
  approvedByLocation;

  static WorkCycleType? fromJson(String value) {
    try {
      return WorkCycleType.values.firstWhere(
        (type) => type.toString().split('.').last == value,
      );
    } catch (_) {
      //TODO: Handle error
      return null;
    }
  }

  Icon get icon {
    switch (this) {
      case WorkCycleType.remoteWork:
        return Icon(Icons.home_outlined, color: AppColors.white);
      case WorkCycleType.approvedByManager:
        return Icon(Icons.check_circle_outline, color: AppColors.white);
      case WorkCycleType.approvedByQr:
        return Icon(Icons.qr_code, color: AppColors.white);
      case WorkCycleType.approvedByLocation:
        return Icon(Icons.location_on_outlined, color: AppColors.white);
      default:
        return Icon(Icons.error, color: AppColors.white); // Fallback icon
    }
  }

  String description(BuildContext context) {
    switch (this) {
      case WorkCycleType.remoteWork:
        return AppLocalizations.of(context).clocked_in_out_cycle_type_remote;
      case WorkCycleType.approvedByManager:
        return AppLocalizations.of(context).clocked_in_out_cycle_type_office_checked;
      case WorkCycleType.approvedByQr:
        return AppLocalizations.of(context).clocked_in_out_cycle_type_office_qr;
      case WorkCycleType.approvedByLocation:
        return AppLocalizations.of(context).clocked_in_out_cycle_type_office_location;
      default:
        return 'Unknown'; // Fallback description
    }
  }
}