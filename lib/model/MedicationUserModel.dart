// To parse this JSON data, do
//
//     final medicationUserModel = medicationUserModelFromJson(jsonString);

import 'dart:convert';

List<MedicationUserModel> medicationUserModelFromJson(String str) =>
    List<MedicationUserModel>.from(
        json.decode(str).map((x) => MedicationUserModel.fromJson(x)));

String medicationUserModelToJson(List<MedicationUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicationUserModel {
  MedicationUserModel({
    this.medicationId,
    this.medicationName,
    this.medicationAmount,
    this.medicationTime,
    this.time,
    this.note,
    this.userId,
  });

  final int? medicationId;
  final String? medicationName;
  final String? medicationAmount;
  final String? medicationTime;
  final DateTime? time;
  final String? note;
  final int? userId;

  factory MedicationUserModel.fromJson(Map<String, dynamic> json) =>
      MedicationUserModel(
        medicationId: json["medication_id"],
        medicationName: json["medication_name"],
        medicationAmount: json["medication_amount"],
        medicationTime: json["medication_time"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        note: json["note"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "medication_id": medicationId,
        "medication_name": medicationName,
        "medication_amount": medicationAmount,
        "medication_time": medicationTime,
        "time": time?.toIso8601String(),
        "note": note,
        "user_id": userId,
      };
}
