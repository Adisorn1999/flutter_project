// To parse this JSON data, do
//
//     final bloodChartsModel = bloodChartsModelFromJson(jsonString);

import 'dart:convert';

List<BloodChartsModel> bloodChartsModelFromJson(String str) =>
    List<BloodChartsModel>.from(
        json.decode(str).map((x) => BloodChartsModel.fromJson(x)));

String bloodChartsModelToJson(List<BloodChartsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodChartsModel {
  BloodChartsModel({
    this.year,
    this.month,
    this.averageBlood,
  });

  int? year;
  int? month;
  int? averageBlood;

  factory BloodChartsModel.fromJson(Map<String, dynamic> json) =>
      BloodChartsModel(
        year: json["year"],
        month: json["month"],
        averageBlood: json["average_blood"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "average_blood": averageBlood,
      };
}
