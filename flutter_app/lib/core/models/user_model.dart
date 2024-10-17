import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  int companyId;
  String position;
  String firstName;
  String lastName;
  String email;
  int? managerId; // Make optional (nullable)
  DateTime createdAt;
  DateTime? updatedAt; // Make optional (nullable)
  String profilePictureUrl;
  List<String>? accessIdentifiers; // Make optional (nullable)

  UserModel({
    required this.id,
    required this.companyId,
    required this.position,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.managerId, // Make optional (nullable)
    required this.createdAt,
    this.updatedAt, // Make optional (nullable)
    required this.profilePictureUrl,
    this.accessIdentifiers, // Make optional (nullable)
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
        accessIdentifiers: json["access_identifiers"] != null
            ? List<String>.from(json["access_identifiers"].map((x) => x))
            : null, // Handle null
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
        "access_identifiers": accessIdentifiers != null
            ? List<dynamic>.from(accessIdentifiers!.map((x) => x))
            : null, // Handle null
      };
}
