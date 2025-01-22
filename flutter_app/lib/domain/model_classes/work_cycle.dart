// To parse this JSON data, do
//
//     final workCycle = workCycleFromJson(jsonString);

import 'dart:convert';
import 'package:flutter_app/core/enums/work_cycles_type.dart';


class WorkCycleModel {
    int id;
    DateTime startTime;
    DateTime endTime;
    WorkCycleType type;

    WorkCycleModel({
        required this.id,
        required this.startTime,
        required this.endTime,
        required this.type,
    });




    factory WorkCycleModel.fromJson(Map<String, dynamic> json) => WorkCycleModel(
        id: json["id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        //TODO: handle null correcly
        type: WorkCycleType.fromJson(json["type"]) ?? WorkCycleType.remoteWork,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": "${startTime.year.toString().padLeft(4, '0')}-${startTime.month.toString().padLeft(2, '0')}-${startTime.day.toString().padLeft(2, '0')}",
        "end_time": "${endTime.year.toString().padLeft(4, '0')}-${endTime.month.toString().padLeft(2, '0')}-${endTime.day.toString().padLeft(2, '0')}",
        "type": type.toString(),
    };

    static WorkCycleModel workCycleModelFromJson(String str) => WorkCycleModel.fromJson(json.decode(str));

    static String workCycleModelToJson(WorkCycleModel data) => json.encode(data.toJson());
}
