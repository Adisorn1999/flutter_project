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
  int year;
  String month;
  double avgFoodCalorie;

  FoodBarchartModel({
    required this.year,
    required this.month,
    required this.avgFoodCalorie,
  });

  factory FoodBarchartModel.fromJson(Map<String, dynamic> json) =>
      FoodBarchartModel(
        year: json["YEAR"],
        month: json["MONTH"],
        avgFoodCalorie: json["AVG(food.calorie)"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "YEAR": year,
        "MONTH": month,
        "AVG(food.calorie)": avgFoodCalorie,
      };
}
