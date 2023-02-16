// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
//import 'dart:io';
import 'dart:async';

class ApiproviderAuth {
  ApiproviderAuth();

  String endpoint = 'http://192.168.1.53:3000';

  Future<http.Response> authen(String? token) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/authen';
    // ignore: unused_local_variable
    var headers = {"token": token};
    return http
        .post(Uri.parse(_url), headers: {"Authorization": "Bearer $token"});
  }

  Future<http.Response> getYear(int user_id) async {
    String _url = '$endpoint/year/$user_id';

    return http.get(Uri.parse(_url));
  }
}
