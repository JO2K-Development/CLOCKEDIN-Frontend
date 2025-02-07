// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_invitation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyInvitationModel _$CompanyInvitationModelFromJson(
    Map<String, dynamic> json) {
  return _CompanyInvitationModel.fromJson(json);
}

/// @nodoc
mixin _$CompanyInvitationModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_logo_url')
  String get companyLogoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'position')
  String get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<String>? get roles => throw _privateConstructorUsedError;

  /// Serializes this CompanyInvitationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyInvitationModelCopyWith<CompanyInvitationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyInvitationModelCopyWith<$Res> {
  factory $CompanyInvitationModelCopyWith(CompanyInvitationModel value,
          $Res Function(CompanyInvitationModel) then) =
      _$CompanyInvitationModelCopyWithImpl<$Res, CompanyInvitationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'company_id') int companyId,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'company_logo_url') String companyLogoUrl,
      @JsonKey(name: 'position') String position,
      @JsonKey(name: 'roles') List<String>? roles});
}

/// @nodoc
class _$CompanyInvitationModelCopyWithImpl<$Res,
        $Val extends CompanyInvitationModel>
    implements $CompanyInvitationModelCopyWith<$Res> {
  _$CompanyInvitationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? companyName = null,
    Object? companyLogoUrl = null,
    Object? position = null,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyLogoUrl: null == companyLogoUrl
          ? _value.companyLogoUrl
          : companyLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyInvitationModelImplCopyWith<$Res>
    implements $CompanyInvitationModelCopyWith<$Res> {
  factory _$$CompanyInvitationModelImplCopyWith(
          _$CompanyInvitationModelImpl value,
          $Res Function(_$CompanyInvitationModelImpl) then) =
      __$$CompanyInvitationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'company_id') int companyId,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'company_logo_url') String companyLogoUrl,
      @JsonKey(name: 'position') String position,
      @JsonKey(name: 'roles') List<String>? roles});
}

/// @nodoc
class __$$CompanyInvitationModelImplCopyWithImpl<$Res>
    extends _$CompanyInvitationModelCopyWithImpl<$Res,
        _$CompanyInvitationModelImpl>
    implements _$$CompanyInvitationModelImplCopyWith<$Res> {
  __$$CompanyInvitationModelImplCopyWithImpl(
      _$CompanyInvitationModelImpl _value,
      $Res Function(_$CompanyInvitationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? companyName = null,
    Object? companyLogoUrl = null,
    Object? position = null,
    Object? roles = freezed,
  }) {
    return _then(_$CompanyInvitationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyLogoUrl: null == companyLogoUrl
          ? _value.companyLogoUrl
          : companyLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyInvitationModelImpl implements _CompanyInvitationModel {
  const _$CompanyInvitationModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'company_id') required this.companyId,
      @JsonKey(name: 'company_name') required this.companyName,
      @JsonKey(name: 'company_logo_url') required this.companyLogoUrl,
      @JsonKey(name: 'position') required this.position,
      @JsonKey(name: 'roles') required final List<String>? roles})
      : _roles = roles;

  factory _$CompanyInvitationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyInvitationModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'company_id')
  final int companyId;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  @override
  @JsonKey(name: 'company_logo_url')
  final String companyLogoUrl;
  @override
  @JsonKey(name: 'position')
  final String position;
  final List<String>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CompanyInvitationModel(id: $id, companyId: $companyId, companyName: $companyName, companyLogoUrl: $companyLogoUrl, position: $position, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyInvitationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyLogoUrl, companyLogoUrl) ||
                other.companyLogoUrl == companyLogoUrl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, companyId, companyName,
      companyLogoUrl, position, const DeepCollectionEquality().hash(_roles));

  /// Create a copy of CompanyInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyInvitationModelImplCopyWith<_$CompanyInvitationModelImpl>
      get copyWith => __$$CompanyInvitationModelImplCopyWithImpl<
          _$CompanyInvitationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyInvitationModelImplToJson(
      this,
    );
  }
}

abstract class _CompanyInvitationModel implements CompanyInvitationModel {
  const factory _CompanyInvitationModel(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'company_id') required final int companyId,
      @JsonKey(name: 'company_name') required final String companyName,
      @JsonKey(name: 'company_logo_url') required final String companyLogoUrl,
      @JsonKey(name: 'position') required final String position,
      @JsonKey(name: 'roles')
      required final List<String>? roles}) = _$CompanyInvitationModelImpl;

  factory _CompanyInvitationModel.fromJson(Map<String, dynamic> json) =
      _$CompanyInvitationModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'company_id')
  int get companyId;
  @override
  @JsonKey(name: 'company_name')
  String get companyName;
  @override
  @JsonKey(name: 'company_logo_url')
  String get companyLogoUrl;
  @override
  @JsonKey(name: 'position')
  String get position;
  @override
  @JsonKey(name: 'roles')
  List<String>? get roles;

  /// Create a copy of CompanyInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyInvitationModelImplCopyWith<_$CompanyInvitationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
