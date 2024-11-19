import 'dart:convert';

import 'package:flutter_app/core/enums/access_identifiers.dart';

AppInitUserModel appInitUserModelFromJson(String str) => AppInitUserModel.fromJson(json.decode(str));

String appInitUserModelToJson(AppInitUserModel data) => json.encode(data.toJson());

class AppInitUserModel {
  int id; // Changed to int
  int? companyId; // Changed to int (nullable)
  String? position;
  String? firstName;
  String? lastName;
  String email;
  int? managerId; // Changed to int (nullable)
  String? profilePictureUrl;
  List<AccessIdentifiers>? accessIdentifiers;

  AppInitUserModel({
    required this.id, // id as an int
    this.companyId,   // companyId as an int (nullable)
    this.position,
    this.firstName,
    this.lastName,
    required this.email,
    this.managerId, // Optional and int
    this.profilePictureUrl,
    required this.accessIdentifiers,
  });

  factory AppInitUserModel.fromJson(Map<String, dynamic> json) => AppInitUserModel(
        id: json["id"], // Treat as int
        companyId: json["company_id"] == null || json["company_id"] == "" ? null : json["company_id"],
        position: json["position"] == "" ? null : json["position"],
        firstName: json["first_name"] == "" ? null : json["first_name"],
        lastName: json["last_name"] == "" ? null : json["last_name"],
        email: json["email"],
        managerId: json["manager_id"] == null || json["manager_id"] == "" ? null : json["manager_id"],
        profilePictureUrl: json["profile_picture_url"],
        accessIdentifiers: List<AccessIdentifiers>.from(json["access_identifiers"].map((x) => AccessIdentifiers.fromString(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id, // Output as int
        "company_id": companyId, // Output as int (nullable)
        "position": position,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "manager_id": managerId, // Output as int (nullable)
        "profile_picture_url": profilePictureUrl,
        "access_identifiers": accessIdentifiers,
      };

  bool hasNecessaryDataForLanding() {
    // Update checks to ensure id and email are not empty and others can be nullable
    return companyId != null &&
        firstName != null &&
        lastName != null &&
        email.isNotEmpty &&
        accessIdentifiers != null && accessIdentifiers!.isNotEmpty;
  }
}
