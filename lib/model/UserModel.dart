// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.year,
  });

  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final String gender;
  final int year;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "year": year,
      };
}
