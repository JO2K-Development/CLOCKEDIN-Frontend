import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app/core/enums/access_identifiers.dart';

part 'current_user_model.freezed.dart';
part 'current_user_model.g.dart';

@freezed
class CurrentUserModel with _$CurrentUserModel {
  const factory CurrentUserModel({
         required int id, // Changed to int
required int? companyId, // Changed to int (nullable)
required String? position,
required String? firstName,
required String? lastName,
required String email,
required int? managerId, // Changed to int (nullable)
required String? profilePictureUrl,
required List<AccessIdentifier>? accessIdentifiers,
  }) = _CurrentUserModel;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) => CurrentUserModel(
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

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "position": position,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "manager_id": managerId,
    "profile_picture_url": profilePictureUrl,
    "access_identifiers": accessIdentifiers?.map((x) => x.toString()).toList(),
  };
 
 static bool isProfileFilled(CurrentUserModel currentUser) {
    return currentUser.firstName != null && currentUser.lastName != null;
  }
}
