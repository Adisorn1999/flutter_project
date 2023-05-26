// To parse this JSON data, do
//
//     final foodsModel = foodsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  FoodsModel({
    required this.foodId,
    required this.foodName,
    required this.calorie,
    required this.date,
  });

  final int foodId;
  final String foodName;
  final int calorie;
  final String date;

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        foodId: json["food_id"],
        foodName: json["food_name"],
        calorie: json["calorie"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "food_name": foodName,
        "calorie": calorie,
        "date": date == null ? null : date,
      };

  toLowerCase() {}
}
