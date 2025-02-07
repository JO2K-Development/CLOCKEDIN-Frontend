import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_invitation_model.freezed.dart';
part 'company_invitation_model.g.dart';

@freezed
class CompanyInvitationModel with _$CompanyInvitationModel {
  const factory CompanyInvitationModel({
     @JsonKey(name: 'id') required int id,
      @JsonKey(name: 'company_id') required int companyId,
      @JsonKey(name: 'company_name') required String companyName,
      @JsonKey(name: 'company_logo_url') required String companyLogoUrl,
      @JsonKey(name: 'position') required String position,
      @JsonKey(name: 'roles') required List<String>? roles,
  }) = _CompanyInvitationModel;

  factory CompanyInvitationModel.fromJson(Map<String, dynamic> json) => _$CompanyInvitationModelFromJson(json);

}
