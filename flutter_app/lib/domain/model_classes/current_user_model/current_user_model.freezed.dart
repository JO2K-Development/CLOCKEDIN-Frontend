// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrentUserModel _$CurrentUserModelFromJson(Map<String, dynamic> json) {
  return _CurrentUserModel.fromJson(json);
}

/// @nodoc
mixin _$CurrentUserModel {
  int get id => throw _privateConstructorUsedError; // Changed to int
  int? get companyId =>
      throw _privateConstructorUsedError; // Changed to int (nullable)
  String? get position => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int? get managerId =>
      throw _privateConstructorUsedError; // Changed to int (nullable)
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  List<AccessIdentifier>? get accessIdentifiers =>
      throw _privateConstructorUsedError;

  /// Serializes this CurrentUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentUserModelCopyWith<CurrentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserModelCopyWith<$Res> {
  factory $CurrentUserModelCopyWith(
          CurrentUserModel value, $Res Function(CurrentUserModel) then) =
      _$CurrentUserModelCopyWithImpl<$Res, CurrentUserModel>;
  @useResult
  $Res call(
      {int id,
      int? companyId,
      String? position,
      String? firstName,
      String? lastName,
      String email,
      int? managerId,
      String? profilePictureUrl,
      List<AccessIdentifier>? accessIdentifiers});
}

/// @nodoc
class _$CurrentUserModelCopyWithImpl<$Res, $Val extends CurrentUserModel>
    implements $CurrentUserModelCopyWith<$Res> {
  _$CurrentUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = freezed,
    Object? position = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = null,
    Object? managerId = freezed,
    Object? profilePictureUrl = freezed,
    Object? accessIdentifiers = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      accessIdentifiers: freezed == accessIdentifiers
          ? _value.accessIdentifiers
          : accessIdentifiers // ignore: cast_nullable_to_non_nullable
              as List<AccessIdentifier>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentUserModelImplCopyWith<$Res>
    implements $CurrentUserModelCopyWith<$Res> {
  factory _$$CurrentUserModelImplCopyWith(_$CurrentUserModelImpl value,
          $Res Function(_$CurrentUserModelImpl) then) =
      __$$CurrentUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? companyId,
      String? position,
      String? firstName,
      String? lastName,
      String email,
      int? managerId,
      String? profilePictureUrl,
      List<AccessIdentifier>? accessIdentifiers});
}

/// @nodoc
class __$$CurrentUserModelImplCopyWithImpl<$Res>
    extends _$CurrentUserModelCopyWithImpl<$Res, _$CurrentUserModelImpl>
    implements _$$CurrentUserModelImplCopyWith<$Res> {
  __$$CurrentUserModelImplCopyWithImpl(_$CurrentUserModelImpl _value,
      $Res Function(_$CurrentUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = freezed,
    Object? position = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = null,
    Object? managerId = freezed,
    Object? profilePictureUrl = freezed,
    Object? accessIdentifiers = freezed,
  }) {
    return _then(_$CurrentUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      accessIdentifiers: freezed == accessIdentifiers
          ? _value._accessIdentifiers
          : accessIdentifiers // ignore: cast_nullable_to_non_nullable
              as List<AccessIdentifier>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentUserModelImpl implements _CurrentUserModel {
  const _$CurrentUserModelImpl(
      {required this.id,
      required this.companyId,
      required this.position,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.managerId,
      required this.profilePictureUrl,
      required final List<AccessIdentifier>? accessIdentifiers})
      : _accessIdentifiers = accessIdentifiers;

  factory _$CurrentUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentUserModelImplFromJson(json);

  @override
  final int id;
// Changed to int
  @override
  final int? companyId;
// Changed to int (nullable)
  @override
  final String? position;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String email;
  @override
  final int? managerId;
// Changed to int (nullable)
  @override
  final String? profilePictureUrl;
  final List<AccessIdentifier>? _accessIdentifiers;
  @override
  List<AccessIdentifier>? get accessIdentifiers {
    final value = _accessIdentifiers;
    if (value == null) return null;
    if (_accessIdentifiers is EqualUnmodifiableListView)
      return _accessIdentifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurrentUserModel(id: $id, companyId: $companyId, position: $position, firstName: $firstName, lastName: $lastName, email: $email, managerId: $managerId, profilePictureUrl: $profilePictureUrl, accessIdentifiers: $accessIdentifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            const DeepCollectionEquality()
                .equals(other._accessIdentifiers, _accessIdentifiers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyId,
      position,
      firstName,
      lastName,
      email,
      managerId,
      profilePictureUrl,
      const DeepCollectionEquality().hash(_accessIdentifiers));

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentUserModelImplCopyWith<_$CurrentUserModelImpl> get copyWith =>
      __$$CurrentUserModelImplCopyWithImpl<_$CurrentUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentUserModelImplToJson(
      this,
    );
  }
}

abstract class _CurrentUserModel implements CurrentUserModel {
  const factory _CurrentUserModel(
          {required final int id,
          required final int? companyId,
          required final String? position,
          required final String? firstName,
          required final String? lastName,
          required final String email,
          required final int? managerId,
          required final String? profilePictureUrl,
          required final List<AccessIdentifier>? accessIdentifiers}) =
      _$CurrentUserModelImpl;

  factory _CurrentUserModel.fromJson(Map<String, dynamic> json) =
      _$CurrentUserModelImpl.fromJson;

  @override
  int get id; // Changed to int
  @override
  int? get companyId; // Changed to int (nullable)
  @override
  String? get position;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String get email;
  @override
  int? get managerId; // Changed to int (nullable)
  @override
  String? get profilePictureUrl;
  @override
  List<AccessIdentifier>? get accessIdentifiers;

  /// Create a copy of CurrentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentUserModelImplCopyWith<_$CurrentUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
