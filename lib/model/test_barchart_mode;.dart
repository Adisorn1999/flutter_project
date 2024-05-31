// To parse this JSON data, do
//
//     final testBarchartModel = testBarchartModelFromJson(jsonString);

import 'dart:convert';

List<TestBarchartModel> testBarchartModelFromJson(String str) =>
    List<TestBarchartModel>.from(
        json.decode(str).map((x) => TestBarchartModel.fromJson(x)));

String testBarchartModelToJson(List<TestBarchartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestBarchartModel {
  int? year;
  String? month;
  double? averageBlood;

  TestBarchartModel({
    this.year,
    this.month,
    this.averageBlood,
  });

  factory TestBarchartModel.fromJson(Map<String, dynamic> json) =>
      TestBarchartModel(
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
