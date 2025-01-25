// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_cycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkCycleModelImpl _$$WorkCycleModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkCycleModelImpl(
      id: (json['id'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      type: $enumDecode(_$WorkCycleTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$WorkCycleModelImplToJson(
        _$WorkCycleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'type': _$WorkCycleTypeEnumMap[instance.type]!,
    };

const _$WorkCycleTypeEnumMap = {
  WorkCycleType.remoteWork: 'remoteWork',
  WorkCycleType.approvedByManager: 'approvedByManager',
  WorkCycleType.approvedByQr: 'approvedByQr',
  WorkCycleType.approvedByLocation: 'approvedByLocation',
};
