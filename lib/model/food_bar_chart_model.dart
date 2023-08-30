// To parse this JSON data, do
//
//     final foodBarchartModel = foodBarchartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FoodBarchartModel> foodBarchartModelFromJson(String str) =>
    List<FoodBarchartModel>.from(
        json.decode(str).map((x) => FoodBarchartModel.fromJson(x)));

String foodBarchartModelToJson(List<FoodBarchartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodBarchartModel {
  FoodBarchartModel({
    this.year,
    this.month,
    this.calorie,
  });

  final int? year;
  final String? month;
  final double? calorie;

  factory FoodBarchartModel.fromJson(Map<String, dynamic> json) =>
      FoodBarchartModel(
        year: json["year"],
        month: json["month"],
        calorie: json["calorie"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "calorie": calorie,
      };
}
