// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'k_v_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KVStatisticModelImpl _$$KVStatisticModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KVStatisticModelImpl(
      name: json['name'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$KVStatisticModelImplToJson(
        _$KVStatisticModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
