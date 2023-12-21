// To parse this JSON data, do
//
//     final avgBloodAllYear = avgBloodAllYearFromJson(jsonString);

// ignore_for_file: unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

List<AvgBloodAllYear> avgBloodAllYearFromJson(String str) =>
    List<AvgBloodAllYear>.from(
        json.decode(str).map((x) => AvgBloodAllYear.fromJson(x)));

String avgBloodAllYearToJson(List<AvgBloodAllYear> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvgBloodAllYear {
  AvgBloodAllYear({
    required this.year,
    required this.averageBlood,
  });

  final int year;
  final double averageBlood;

  factory AvgBloodAllYear.fromJson(Map<String, dynamic> json) =>
      AvgBloodAllYear(
        year: json["year"],
        averageBlood: json["average_blood"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "average_blood": averageBlood,
      };
}
