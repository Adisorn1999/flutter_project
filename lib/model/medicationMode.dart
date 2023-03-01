// To parse this JSON data, do
//
//     final medicationModel = medicationModelFromJson(jsonString);

import 'dart:convert';

List<MedicationModel> medicationModelFromJson(String str) =>
    List<MedicationModel>.from(
        json.decode(str).map((x) => MedicationModel.fromJson(x)));

String medicationModelToJson(List<MedicationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicationModel {
  MedicationModel({
    this.medicationId,
    this.medicationName,
    this.medicationAmount,
    this.medicationTime,
    this.time,
    this.note,
  });

  final int? medicationId;
  final String? medicationName;
  final String? medicationAmount;
  final String? medicationTime;
  final DateTime? time;
  final String? note;

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      MedicationModel(
        medicationId: json["medication_id"],
        medicationName: json["medication_name"],
        medicationAmount: json["medication_amount"],
        medicationTime: json["medication_time"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "medication_id": medicationId,
        "medication_name": medicationName,
        "medication_amount": medicationAmount,
        "medication_time": medicationTime,
        "time": time?.toIso8601String(),
        "note": note,
      };
}
