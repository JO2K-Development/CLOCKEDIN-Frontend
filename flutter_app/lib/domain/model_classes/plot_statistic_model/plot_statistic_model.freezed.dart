// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plot_statistic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlotStatisticModel _$PlotStatisticModelFromJson(Map<String, dynamic> json) {
  return _PlotStatisticModel.fromJson(json);
}

/// @nodoc
mixin _$PlotStatisticModel {
  String get title => throw _privateConstructorUsedError;
  String get x_label => throw _privateConstructorUsedError;
  String get y_label => throw _privateConstructorUsedError;
  Map<String, double> get data => throw _privateConstructorUsedError;

  /// Serializes this PlotStatisticModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlotStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlotStatisticModelCopyWith<PlotStatisticModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlotStatisticModelCopyWith<$Res> {
  factory $PlotStatisticModelCopyWith(
          PlotStatisticModel value, $Res Function(PlotStatisticModel) then) =
      _$PlotStatisticModelCopyWithImpl<$Res, PlotStatisticModel>;
  @useResult
  $Res call(
      {String title, String x_label, String y_label, Map<String, double> data});
}

/// @nodoc
class _$PlotStatisticModelCopyWithImpl<$Res, $Val extends PlotStatisticModel>
    implements $PlotStatisticModelCopyWith<$Res> {
  _$PlotStatisticModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlotStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? x_label = null,
    Object? y_label = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      x_label: null == x_label
          ? _value.x_label
          : x_label // ignore: cast_nullable_to_non_nullable
              as String,
      y_label: null == y_label
          ? _value.y_label
          : y_label // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlotStatisticModelImplCopyWith<$Res>
    implements $PlotStatisticModelCopyWith<$Res> {
  factory _$$PlotStatisticModelImplCopyWith(_$PlotStatisticModelImpl value,
          $Res Function(_$PlotStatisticModelImpl) then) =
      __$$PlotStatisticModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String x_label, String y_label, Map<String, double> data});
}

/// @nodoc
class __$$PlotStatisticModelImplCopyWithImpl<$Res>
    extends _$PlotStatisticModelCopyWithImpl<$Res, _$PlotStatisticModelImpl>
    implements _$$PlotStatisticModelImplCopyWith<$Res> {
  __$$PlotStatisticModelImplCopyWithImpl(_$PlotStatisticModelImpl _value,
      $Res Function(_$PlotStatisticModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlotStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? x_label = null,
    Object? y_label = null,
    Object? data = null,
  }) {
    return _then(_$PlotStatisticModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      x_label: null == x_label
          ? _value.x_label
          : x_label // ignore: cast_nullable_to_non_nullable
              as String,
      y_label: null == y_label
          ? _value.y_label
          : y_label // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlotStatisticModelImpl implements _PlotStatisticModel {
  const _$PlotStatisticModelImpl(
      {required this.title,
      required this.x_label,
      required this.y_label,
      required final Map<String, double> data})
      : _data = data;

  factory _$PlotStatisticModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlotStatisticModelImplFromJson(json);

  @override
  final String title;
  @override
  final String x_label;
  @override
  final String y_label;
  final Map<String, double> _data;
  @override
  Map<String, double> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'PlotStatisticModel(title: $title, x_label: $x_label, y_label: $y_label, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlotStatisticModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.x_label, x_label) || other.x_label == x_label) &&
            (identical(other.y_label, y_label) || other.y_label == y_label) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, x_label, y_label,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of PlotStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlotStatisticModelImplCopyWith<_$PlotStatisticModelImpl> get copyWith =>
      __$$PlotStatisticModelImplCopyWithImpl<_$PlotStatisticModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlotStatisticModelImplToJson(
      this,
    );
  }
}

abstract class _PlotStatisticModel implements PlotStatisticModel {
  const factory _PlotStatisticModel(
      {required final String title,
      required final String x_label,
      required final String y_label,
      required final Map<String, double> data}) = _$PlotStatisticModelImpl;

  factory _PlotStatisticModel.fromJson(Map<String, dynamic> json) =
      _$PlotStatisticModelImpl.fromJson;

  @override
  String get title;
  @override
  String get x_label;
  @override
  String get y_label;
  @override
  Map<String, double> get data;

  /// Create a copy of PlotStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlotStatisticModelImplCopyWith<_$PlotStatisticModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
