// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlotStatisticModelImpl _$$PlotStatisticModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlotStatisticModelImpl(
      title: json['title'] as String,
      x_axis: json['x_axis'] as String,
      y_axis: json['y_axis'] as String,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$PlotStatisticModelImplToJson(
        _$PlotStatisticModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'x_axis': instance.x_axis,
      'y_axis': instance.y_axis,
      'data': instance.data,
    };
