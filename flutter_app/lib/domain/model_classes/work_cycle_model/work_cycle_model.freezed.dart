// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_cycle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkCycleModel _$WorkCycleModelFromJson(Map<String, dynamic> json) {
  return _WorkCycleModel.fromJson(json);
}

/// @nodoc
mixin _$WorkCycleModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  WorkCycleType get type => throw _privateConstructorUsedError;

  /// Serializes this WorkCycleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkCycleModelCopyWith<WorkCycleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkCycleModelCopyWith<$Res> {
  factory $WorkCycleModelCopyWith(
          WorkCycleModel value, $Res Function(WorkCycleModel) then) =
      _$WorkCycleModelCopyWithImpl<$Res, WorkCycleModel>;
  @useResult
  $Res call({int id, DateTime startTime, DateTime endTime, WorkCycleType type});
}

/// @nodoc
class _$WorkCycleModelCopyWithImpl<$Res, $Val extends WorkCycleModel>
    implements $WorkCycleModelCopyWith<$Res> {
  _$WorkCycleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkCycleType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkCycleModelImplCopyWith<$Res>
    implements $WorkCycleModelCopyWith<$Res> {
  factory _$$WorkCycleModelImplCopyWith(_$WorkCycleModelImpl value,
          $Res Function(_$WorkCycleModelImpl) then) =
      __$$WorkCycleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime startTime, DateTime endTime, WorkCycleType type});
}

/// @nodoc
class __$$WorkCycleModelImplCopyWithImpl<$Res>
    extends _$WorkCycleModelCopyWithImpl<$Res, _$WorkCycleModelImpl>
    implements _$$WorkCycleModelImplCopyWith<$Res> {
  __$$WorkCycleModelImplCopyWithImpl(
      _$WorkCycleModelImpl _value, $Res Function(_$WorkCycleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
  }) {
    return _then(_$WorkCycleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkCycleType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkCycleModelImpl implements _WorkCycleModel {
  const _$WorkCycleModelImpl(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.type});

  factory _$WorkCycleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkCycleModelImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final WorkCycleType type;

  @override
  String toString() {
    return 'WorkCycleModel(id: $id, startTime: $startTime, endTime: $endTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkCycleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, endTime, type);

  /// Create a copy of WorkCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkCycleModelImplCopyWith<_$WorkCycleModelImpl> get copyWith =>
      __$$WorkCycleModelImplCopyWithImpl<_$WorkCycleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkCycleModelImplToJson(
      this,
    );
  }
}

abstract class _WorkCycleModel implements WorkCycleModel {
  const factory _WorkCycleModel(
      {required final int id,
      required final DateTime startTime,
      required final DateTime endTime,
      required final WorkCycleType type}) = _$WorkCycleModelImpl;

  factory _WorkCycleModel.fromJson(Map<String, dynamic> json) =
      _$WorkCycleModelImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  WorkCycleType get type;

  /// Create a copy of WorkCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkCycleModelImplCopyWith<_$WorkCycleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
