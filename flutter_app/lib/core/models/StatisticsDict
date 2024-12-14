import 'dart:convert';

// initial idea is that we pass a language in header and get a dictionary of statistics
// we can take in (name, value) or (name, (x_label, y_label), [values]) format



class StatisticsDict {
    Map<String, dynamic> data;

    StatisticsDict({
        required this.data,
    });

    factory StatisticsDict.fromJson(Map<String, dynamic> json) => StatisticsDict(
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
    };

    static StatisticsDict statisticsDictFromJson(String str) => StatisticsDict.fromJson(json.decode(str));

    static String statisticsDictToJson(StatisticsDict data) => json.encode(data);
}