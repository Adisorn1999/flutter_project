// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.ok,
    required this.data,
  });

  final bool ok;
  final List<Datum> data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        ok: json["ok"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.birthday,
  });

  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final String birthday;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthday: json["birthday"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "birthday": birthday,
      };
}
