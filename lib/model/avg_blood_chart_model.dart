// To parse this JSON data, do
//
//     final avGuserModel = avGuserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AvGuserModel avGuserModelFromJson(String str) =>
    AvGuserModel.fromJson(json.decode(str));

String avGuserModelToJson(AvGuserModel data) => json.encode(data.toJson());

class AvGuserModel {
  AvGuserModel({
    required this.ok,
    required this.data,
    required this.code,
  });

  final bool ok;
  final List<Map<String, double>> data;
  final int code;

  factory AvGuserModel.fromJson(Map<String, dynamic> json) => AvGuserModel(
        ok: json["ok"],
        data: List<Map<String, double>>.from(json["data"].map((x) => Map.from(x)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "code": code,
      };
}
