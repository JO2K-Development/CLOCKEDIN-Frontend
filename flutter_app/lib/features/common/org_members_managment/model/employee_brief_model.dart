import 'dart:convert';

import 'package:flutter_app/core/enums/access_identifiers.dart';

EmployeeBriefModel employeeBriefModelFromJson(String str) => EmployeeBriefModel.fromJson(json.decode(str));

String employeeBriefModelToJson(EmployeeBriefModel data) => json.encode(data.toJson());

class EmployeeBriefModel {
  int id; // Changed to int
  int companyId; // Changed to int (nullable)
  String? position;
  String firstName;
  String lastName;
  String? additionalInfo;
  // String email;
  int? managerId; // Changed to int (nullable)
  String? profilePictureUrl;
  // List<AccessIdentifier>? accessIdentifiers;

  EmployeeBriefModel({
    required this.id, // id as an int
    required this.companyId,   // companyId as an int (nullable)
    required this.position,
    required this.firstName,
    required this.lastName,
    this.additionalInfo,
    // required this.email,
    this.managerId, // Optional and int
    this.profilePictureUrl,
    // required this.accessIdentifiers,
  });

  factory EmployeeBriefModel.fromJson(Map<String, dynamic> json) => EmployeeBriefModel(
        id: json["id"], // Treat as int
        companyId: json["company_id"],
        position: json["position"] == "" ? null : json["position"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        // email: json["email"],
        managerId: json["manager_id"] == null || json["manager_id"] == "" ? null : json["manager_id"],
        profilePictureUrl: json["profile_picture_url"],
        additionalInfo: json["additional_info"] == "" ? null : json["additional_info"],
        // accessIdentifiers: List<AccessIdentifier>.from(json["access_identifiers"].map((x) => AccessIdentifier.fromString(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id, // Output as int
        "company_id": companyId, // Output as int (nullable)
        "position": position,
        "first_name": firstName,
        "last_name": lastName,
        "additional_info": additionalInfo,
        // "email": email,
        "manager_id": managerId, // Output as int (nullable)
        "profile_picture_url": profilePictureUrl,
        // "access_identifiers": accessIdentifiers,
      };

}

