// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      position: json['position'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String,
      managerId: (json['managerId'] as num?)?.toInt(),
      profilePictureUrl: json['profilePictureUrl'] as String?,
      accessIdentifiers: (json['accessIdentifiers'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AccessIdentifierEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'position': instance.position,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'managerId': instance.managerId,
      'profilePictureUrl': instance.profilePictureUrl,
      'accessIdentifiers': instance.accessIdentifiers
          ?.map((e) => _$AccessIdentifierEnumMap[e]!)
          .toList(),
    };

const _$AccessIdentifierEnumMap = {
  AccessIdentifier.employee: 'employee',
  AccessIdentifier.manager: 'manager',
  AccessIdentifier.admin: 'admin',
};
