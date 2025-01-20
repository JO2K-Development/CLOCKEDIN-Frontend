import 'package:flutter_app/core/enums/access_identifiers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_api_model.freezed.dart';
part 'user_api_model.g.dart';

@freezed
class UserApiModel with _$UserApiModel {
  const factory UserApiModel({
    required int id, // Changed to int
required int? companyId, // Changed to int (nullable)
required String? position,
required String? firstName,
required String? lastName,
required String email,
required int? managerId, // Changed to int (nullable)
required String? profilePictureUrl,
required List<AccessIdentifier>? accessIdentifiers,
  }) = _UserApiModel;

  factory UserApiModel.fromJson(Map<String, dynamic> json) => UserApiModel(
        id: json["id"], // Treat as int
        companyId: json["company_id"] == null || json["company_id"] == "" ? null : json["company_id"],
        position: json["position"] == "" ? null : json["position"],
        firstName: json["first_name"] == "" ? null : json["first_name"],
        lastName: json["last_name"] == "" ? null : json["last_name"],
        email: json["email"],
        managerId: json["manager_id"] == null || json["manager_id"] == "" ? null : json["manager_id"],
        profilePictureUrl: json["profile_picture_url"],
        accessIdentifiers: List<AccessIdentifier>.from(json["access_identifiers"].map((x) => AccessIdentifier.fromString(x))),
  );

}
