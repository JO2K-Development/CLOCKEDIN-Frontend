// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'k_v_statistic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KVStatisticModel _$KVStatisticModelFromJson(Map<String, dynamic> json) {
  return _KVStatisticModel.fromJson(json);
}

/// @nodoc
mixin _$KVStatisticModel {
  String get name => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this KVStatisticModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KVStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KVStatisticModelCopyWith<KVStatisticModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KVStatisticModelCopyWith<$Res> {
  factory $KVStatisticModelCopyWith(
          KVStatisticModel value, $Res Function(KVStatisticModel) then) =
      _$KVStatisticModelCopyWithImpl<$Res, KVStatisticModel>;
  @useResult
  $Res call({String name, int value});
}

/// @nodoc
class _$KVStatisticModelCopyWithImpl<$Res, $Val extends KVStatisticModel>
    implements $KVStatisticModelCopyWith<$Res> {
  _$KVStatisticModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KVStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KVStatisticModelImplCopyWith<$Res>
    implements $KVStatisticModelCopyWith<$Res> {
  factory _$$KVStatisticModelImplCopyWith(_$KVStatisticModelImpl value,
          $Res Function(_$KVStatisticModelImpl) then) =
      __$$KVStatisticModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int value});
}

/// @nodoc
class __$$KVStatisticModelImplCopyWithImpl<$Res>
    extends _$KVStatisticModelCopyWithImpl<$Res, _$KVStatisticModelImpl>
    implements _$$KVStatisticModelImplCopyWith<$Res> {
  __$$KVStatisticModelImplCopyWithImpl(_$KVStatisticModelImpl _value,
      $Res Function(_$KVStatisticModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KVStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$KVStatisticModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KVStatisticModelImpl implements _KVStatisticModel {
  const _$KVStatisticModelImpl({required this.name, required this.value});

  factory _$KVStatisticModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KVStatisticModelImplFromJson(json);

  @override
  final String name;
  @override
  final int value;

  @override
  String toString() {
    return 'KVStatisticModel(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KVStatisticModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  /// Create a copy of KVStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KVStatisticModelImplCopyWith<_$KVStatisticModelImpl> get copyWith =>
      __$$KVStatisticModelImplCopyWithImpl<_$KVStatisticModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KVStatisticModelImplToJson(
      this,
    );
  }
}

abstract class _KVStatisticModel implements KVStatisticModel {
  const factory _KVStatisticModel(
      {required final String name,
      required final int value}) = _$KVStatisticModelImpl;

  factory _KVStatisticModel.fromJson(Map<String, dynamic> json) =
      _$KVStatisticModelImpl.fromJson;

  @override
  String get name;
  @override
  int get value;

  /// Create a copy of KVStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KVStatisticModelImplCopyWith<_$KVStatisticModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
