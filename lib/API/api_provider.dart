// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
//import 'dart:io';
import 'dart:async';

class Apiprovider {
  Apiprovider();

  String endpoint = 'http://192.168.1.53:3000';

  Future<http.Response> doLogin(String username, String password) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/login';
    var body = {"username": username, "password": password};
    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> doRegister(
      String username,
      String password,
      String first_name,
      String last_name,
      String birthday,
      String gender) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/register';
    var body = {
      "username": username,
      "password": password,
      "first_name": first_name,
      "last_name": last_name,
      "birthday": birthday,
      "gender": gender
    };
    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> authen(String? token) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/authen';
    // ignore: unused_local_variable
    var headers = {"token": token};
    return http
        .post(Uri.parse(_url), headers: {"Authorization": "Bearer $token"});
  }

  Future<http.Response> getUserById(int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/user/$user_id';
    return http.get(
      Uri.parse(_url),
    );
  }
}
