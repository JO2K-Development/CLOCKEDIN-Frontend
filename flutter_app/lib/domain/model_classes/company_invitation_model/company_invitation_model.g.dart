// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyInvitationModelImpl _$$CompanyInvitationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyInvitationModelImpl(
      id: (json['id'] as num).toInt(),
      companyId: (json['company_id'] as num).toInt(),
      companyName: json['company_name'] as String,
      companyLogoUrl: json['company_logo_url'] as String,
      position: json['position'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CompanyInvitationModelImplToJson(
        _$CompanyInvitationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'company_name': instance.companyName,
      'company_logo_url': instance.companyLogoUrl,
      'position': instance.position,
      'roles': instance.roles,
    };
