import 'package:flutter_app/core/enums/work_cycles_type.dart';
import 'package:flutter_app/core/utils/functions/time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'work_cycle_model.freezed.dart';
part 'work_cycle_model.g.dart';

@freezed
class WorkCycleModel with _$WorkCycleModel {
  const factory WorkCycleModel({
      required int id,
        required DateTime startTime,
        required DateTime endTime,
        required WorkCycleType type,
  }) = _WorkCycleModel;

  factory WorkCycleModel.fromJson(Map<String, dynamic> json) => WorkCycleModel(
        id: json["id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        //TODO: handle null correcly
        type: WorkCycleType.fromJson(json["type"]) ?? WorkCycleType.remoteWork,
    );

    static filterEventsForDay(List<WorkCycleModel> workCycles, DateTime day) {
    return workCycles.where((element) {
      return TimeUtils.isDayInWorkCycle(day, element.startTime, element.endTime);
    }).toList();
  }
}
