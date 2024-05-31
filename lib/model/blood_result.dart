// To parse this JSON data, do
//
//     final bloodResult = bloodResultFromJson(jsonString);

import 'dart:convert';

List<BloodResult> bloodResultFromJson(String str) => List<BloodResult>.from(
    json.decode(str).map((x) => BloodResult.fromJson(x)));

String bloodResultToJson(List<BloodResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BloodResult {
  int? bloodId;
  DateTime? bloodTime;
  String? month;
  int? bloodLevel;
  String? note;
  int? userId;

  BloodResult({
    this.bloodId,
    this.bloodTime,
    this.month,
    this.bloodLevel,
    this.note,
    this.userId,
  });

  factory BloodResult.fromJson(Map<String, dynamic> json) => BloodResult(
        bloodId: json["blood_id"],
        bloodTime: json["blood_time"] == null
            ? null
            : DateTime.parse(json["blood_time"]),
        month: json["month"],
        bloodLevel: json["blood_level"],
        note: json["note"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "blood_id": bloodId,
        "blood_time": bloodTime?.toIso8601String(),
        "month": month,
        "blood_level": bloodLevel,
        "note": note,
        "user_id": userId,
      };
}
