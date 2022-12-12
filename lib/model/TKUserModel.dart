// To parse this JSON data, do
//
//     final tkUserModel = tkUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TkUserModel tkUserModelFromJson(String str) =>
    TkUserModel.fromJson(json.decode(str));

String tkUserModelToJson(TkUserModel data) => json.encode(data.toJson());

class TkUserModel {
  TkUserModel({
    required this.ok,
    required this.message,
    required this.token,
    required this.code,
  });

  final bool ok;
  final String message;
  final String token;
  final int code;

  factory TkUserModel.fromJson(Map<String, dynamic> json) => TkUserModel(
        ok: json["ok"],
        message: json["message"],
        token: json["token"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "token": token,
        "code": code,
      };
}
