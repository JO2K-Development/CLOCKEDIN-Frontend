// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentUserModelImpl _$$CurrentUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentUserModelImpl(
      id: (json['id'] as num).toInt(),
      companyId: (json['company_id'] as num?)?.toInt(),
      position: json['position'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String,
      managerId: (json['manager_id'] as num?)?.toInt(),
      profilePictureUrl: json['profile_picture_url'] as String?,
      accessIdentifiers: (json['access_identifiers'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AccessIdentifierEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$CurrentUserModelImplToJson(
        _$CurrentUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'position': instance.position,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'manager_id': instance.managerId,
      'profile_picture_url': instance.profilePictureUrl,
      'access_identifiers': instance.accessIdentifiers
          ?.map((e) => _$AccessIdentifierEnumMap[e]!)
          .toList(),
    };

const _$AccessIdentifierEnumMap = {
  AccessIdentifier.employee: 'employee',
  AccessIdentifier.manager: 'manager',
  AccessIdentifier.admin: 'admin',
};
