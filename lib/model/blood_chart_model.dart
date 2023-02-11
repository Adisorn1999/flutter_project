// To parse this JSON data, do
//
//     final bloodChartsModel = bloodChartsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BloodChartsModel bloodChartsModelFromJson(String str) =>
    BloodChartsModel.fromJson(json.decode(str));

String bloodChartsModelToJson(BloodChartsModel data) =>
    json.encode(data.toJson());

class BloodChartsModel {
  BloodChartsModel({
    required this.ok,
    required this.data,
    required this.code,
  });

  final bool ok;
  final List<Datum> data;
  final int code;

  factory BloodChartsModel.fromJson(Map<String, dynamic> json) =>
      BloodChartsModel(
        ok: json["ok"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
      };
}

class Datum {
  Datum({
    required this.bloodId,
    required this.bloodLevel,
    required this.bloodTime,
    required this.note,
    required this.userId,
  });

  final int bloodId;
  final int bloodLevel;
  final String bloodTime;
  final String note;
  final int userId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bloodId: json["blood_id"],
        bloodLevel: json["blood_level"],
        bloodTime: json["blood_time"],
        note: json["note"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "blood_id": bloodId,
        "blood_level": bloodLevel,
        "blood_time": bloodTime,
        "note": note,
        "user_id": userId,
      };
}
