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
    required this.decoded,
    required this.code,
  });

  final bool ok;
  final String message;
  final Decoded decoded;
  final int code;

  factory TkUserModel.fromJson(Map<String, dynamic> json) => TkUserModel(
        ok: json["ok"],
        message: json["message"],
        decoded: Decoded.fromJson(json["decoded"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "decoded": decoded.toJson(),
        "code": code,
      };
}

class Decoded {
  Decoded({
    required this.userId,
    required this.username,
    required this.iat,
    required this.exp,
  });

  final int userId;
  final String username;
  final int iat;
  final int exp;

  factory Decoded.fromJson(Map<String, dynamic> json) => Decoded(
        userId: json["user_id"],
        username: json["username"],
        iat: json["iat"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "iat": iat,
        "exp": exp,
      };
}
