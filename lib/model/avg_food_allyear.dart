// To parse this JSON data, do
//
//     final avgFoodAllYear = avgFoodAllYearFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AvgFoodAllYear> avgFoodAllYearFromJson(String str) =>
    List<AvgFoodAllYear>.from(
        json.decode(str).map((x) => AvgFoodAllYear.fromJson(x)));

String avgFoodAllYearToJson(List<AvgFoodAllYear> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvgFoodAllYear {
  int year;
  double averageCalorie;

  AvgFoodAllYear({
    required this.year,
    required this.averageCalorie,
  });

  factory AvgFoodAllYear.fromJson(Map<String, dynamic> json) => AvgFoodAllYear(
        year: json["year"],
        averageCalorie: json["average_calorie"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "average_calorie": averageCalorie,
      };
}
