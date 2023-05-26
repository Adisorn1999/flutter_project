// To parse this JSON data, do
//
//     final barChartModel = barChartModelFromJson(jsonString);

import 'dart:convert';

List<BarChartModel> barChartModelFromJson(String str) =>
    List<BarChartModel>.from(
        json.decode(str).map((x) => BarChartModel.fromJson(x)));

String barChartModelToJson(List<BarChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarChartModel {
  BarChartModel({
    this.year,
    this.month,
    this.averageBlood,
  });

  final int? year;
  final String? month;
  final double? averageBlood;

  factory BarChartModel.fromJson(Map<String, dynamic> json) => BarChartModel(
        year: json["year"],
        month: json["month"],
        averageBlood: json["average_blood"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "average_blood": averageBlood,
      };
}
