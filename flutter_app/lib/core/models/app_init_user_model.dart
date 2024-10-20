import 'dart:convert';

AppInitUserModel appInitUserModelFromJson(String str) => AppInitUserModel.fromJson(json.decode(str));

String appInitUserModelToJson(AppInitUserModel data) => json.encode(data.toJson());

class AppInitUserModel {
  String id;
  String companyId;
  String position;
  String firstName;
  String lastName;
  String email;
  String? managerId; // Optional
  DateTime createdAt;
  DateTime? updatedAt; // Optional
  String profilePictureUrl;
  List<String> accessIdentifiers;

  AppInitUserModel({
    required this.id,
    required this.companyId,
    required this.position,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.managerId, // Optional
    required this.createdAt,
    this.updatedAt, // Optional
    required this.profilePictureUrl,
    required this.accessIdentifiers,
  });

  factory AppInitUserModel.fromJson(Map<String, dynamic> json) => AppInitUserModel(
        id: json["id"],
        companyId: json["company_id"],
        position: json["position"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        managerId: json["manager_id"], // Can be null
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null, // Handle null
        profilePictureUrl: json["profile_picture_url"],
        accessIdentifiers: List<String>.from(json["access_identifiers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "position": position,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "manager_id": managerId, // Will be null if not set
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(), // Handle null
        "profile_picture_url": profilePictureUrl,
        "access_identifiers": List<dynamic>.from(accessIdentifiers.map((x) => x)),
      };
}
