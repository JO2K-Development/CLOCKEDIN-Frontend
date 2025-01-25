import 'package:flutter_app/domain/model_classes/k_v_statistic_model/k_v_statistic_model.dart';
import 'package:flutter_app/domain/model_classes/plot_statistic_model/plot_statistic_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

@freezed
class StatisticsModel with _$StatisticsModel {
  const factory StatisticsModel({
     required List<dynamic> statistics,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _customFromJson(json);

  static StatisticsModel _customFromJson(Map<String, dynamic> json) {
    final list = json['result'] as List<dynamic>;
    final stats = <dynamic>[];
    list.forEach((element) {
      final k = element.keys.first;
      switch (k) {
        case 'simple':
          stats.add(KVStatisticModel.fromJson(element[k] as Map<String, dynamic>));
          break; 
        case 'plot':
          stats.add(PlotStatisticModel.fromJson(element[k] as Map<String, dynamic>));
          break;
      }
    });
    return StatisticsModel(statistics: stats);
  }
}


