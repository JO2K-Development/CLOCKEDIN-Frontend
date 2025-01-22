
 import 'package:freezed_annotation/freezed_annotation.dart';
 part 'k_v_statistic_model.freezed.dart';
 part 'k_v_statistic_model.g.dart';
 
 @freezed
 class KVStatisticModel with _$KVStatisticModel {
   const factory KVStatisticModel({
      required String name,
      required int value,
   }) = _KVStatisticModel;
   factory KVStatisticModel.fromJson(Map<String, dynamic> json) => _$KVStatisticModelFromJson(json);
 }
 