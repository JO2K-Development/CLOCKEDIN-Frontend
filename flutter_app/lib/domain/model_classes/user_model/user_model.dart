import 'package:flutter_app/core/enums/access_identifiers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
              required int id, // Changed to int
required int? companyId, // Changed to int (nullable)
required String? position,
required String? firstName,
required String? lastName,
required String email,
required int? managerId, // Changed to int (nullable)
required String? profilePictureUrl,
required List<AccessIdentifier>? accessIdentifiers,
  }) = _UserModel;
   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
