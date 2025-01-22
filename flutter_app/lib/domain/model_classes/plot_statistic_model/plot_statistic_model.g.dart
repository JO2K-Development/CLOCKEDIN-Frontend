// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlotStatisticModelImpl _$$PlotStatisticModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlotStatisticModelImpl(
      title: json['title'] as String,
      x_label: json['x_label'] as String,
      y_label: json['y_label'] as String,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$PlotStatisticModelImplToJson(
        _$PlotStatisticModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'x_label': instance.x_label,
      'y_label': instance.y_label,
      'data': instance.data,
    };
