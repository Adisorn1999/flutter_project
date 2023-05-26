// To parse this JSON data, do
//
//     final yearModel = yearModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<YearModel> yearModelFromJson(String str) =>
    List<YearModel>.from(json.decode(str).map((x) => YearModel.fromJson(x)));

String yearModelToJson(List<YearModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YearModel {
  YearModel({
    required this.year,
  });

  final int year;

  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
      };
}
