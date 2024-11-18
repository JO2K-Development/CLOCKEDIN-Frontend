// To parse this JSON data, do
//
//     final workCycle = workCycleFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_app/core/services/network_handler.dart';

WorkCycle workCycleFromJson(String str) => WorkCycle.fromJson(json.decode(str));

String workCycleToJson(WorkCycle data) => json.encode(data.toJson());

class WorkCycle {
    int id;
    DateTime startTime;
    DateTime endTime;

    WorkCycle({
        required this.id,
        required this.startTime,
        required this.endTime,
    });

    set setStartTime(DateTime startTime) => this.startTime = startTime;
    set setEndTime(DateTime endTime) => this.endTime = endTime;

    Future<void> patchTimesToDb() async {
      var body = jsonEncode({
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String()
      });
      var endPoint = '/work_cycles/$id/';
      NetworkHandler.patch(body, endPoint);
    }

    Future<void> postToDb() async {
      //TODO: Add full body
      // var body = jsonEncode({
      //   "start_time": startTime.toIso8601String(),
      //   "end_time": endTime.toIso8601String()
      // });
      // var endPoint = '/work_cycles/';
      // NetworkHandler.post(body, endPoint);
    }

    Future<void> deleteFromDb() async {
      var endPoint = '/work_cycles/$id/';
      //TODO: NetworkHandler.delete
      // NetworkHandler.delete(endPoint);
    }

    factory WorkCycle.fromJson(Map<String, dynamic> json) => WorkCycle(
        id: json["id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": "${startTime.year.toString().padLeft(4, '0')}-${startTime.month.toString().padLeft(2, '0')}-${startTime.day.toString().padLeft(2, '0')}",
        "end_time": "${endTime.year.toString().padLeft(4, '0')}-${endTime.month.toString().padLeft(2, '0')}-${endTime.day.toString().padLeft(2, '0')}",
    };
}
