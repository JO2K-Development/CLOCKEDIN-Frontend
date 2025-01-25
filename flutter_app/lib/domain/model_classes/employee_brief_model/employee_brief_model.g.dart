// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_brief_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeBriefModelImpl _$$EmployeeBriefModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeBriefModelImpl(
      id: (json['id'] as num).toInt(),
      companyId: (json['companyId'] as num).toInt(),
      position: json['position'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      additionalInfo: json['additionalInfo'] as String?,
      managerId: (json['managerId'] as num?)?.toInt(),
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$$EmployeeBriefModelImplToJson(
        _$EmployeeBriefModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'position': instance.position,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'additionalInfo': instance.additionalInfo,
      'managerId': instance.managerId,
      'profilePictureUrl': instance.profilePictureUrl,
    };
