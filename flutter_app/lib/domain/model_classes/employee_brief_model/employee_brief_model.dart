import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_brief_model.freezed.dart';
part 'employee_brief_model.g.dart';

@freezed
class EmployeeBriefModel with _$EmployeeBriefModel {
  const factory EmployeeBriefModel({
  required int id, // Changed to int
  required int companyId, // Changed to int (nullable)
  required String? position,
  required String firstName,
  required String lastName,
  required String? additionalInfo,
   // String email;
  required int? managerId, // Changed to int (nullable)
  required String? profilePictureUrl,
   // List<AccessIdentifier>? accessIdentifiers;
  }) = _EmployeeBriefModel;
  factory EmployeeBriefModel.fromJson(Map<String, dynamic> json) => _$EmployeeBriefModelFromJson(json);
}
