
 import 'package:freezed_annotation/freezed_annotation.dart';
 part 'plot_statistic_model.freezed.dart';
 part 'plot_statistic_model.g.dart';
 
 @freezed
 class PlotStatisticModel with _$PlotStatisticModel {
   const factory PlotStatisticModel({
      required String title,
      required String x_axis,
      required String y_axis,
      required Map<String, double> data,
   }) = _PlotStatisticModel;
   factory PlotStatisticModel.fromJson(Map<String, dynamic> json) => _$PlotStatisticModelFromJson(json);
 }
 