// To parse this JSON data, do
//
//     final foodYearModel = foodYearModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FoodYearModel> foodYearModelFromJson(String str) =>
    List<FoodYearModel>.from(
        json.decode(str).map((x) => FoodYearModel.fromJson(x)));

String foodYearModelToJson(List<FoodYearModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodYearModel {
  int year;

  FoodYearModel({
    required this.year,
  });

  factory FoodYearModel.fromJson(Map<String, dynamic> json) => FoodYearModel(
        year: json["YEAR"],
      );

  Map<String, dynamic> toJson() => {
        "YEAR": year,
      };
}
