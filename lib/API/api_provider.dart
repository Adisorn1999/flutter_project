// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class Apiprovider {
  Apiprovider();

  String endpoint = 'http://192.168.1.32:3000';

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

  Future<http.Response> addBlood(
      String blood_level, String blood_time, String note, int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/$user_id';
    var body = {
      "blood_level": blood_level,
      "blood_time": blood_time,
      "note": note
    };
    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> addmedication(
      String medication_name,
      String medication_amount,
      String medication_time,
      String time,
      String note,
      int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/medication/$user_id';
    var body = {
      "medication_name": medication_name,
      "medication_amount": medication_amount,
      "medication_time": medication_time,
      "time": time,
      "note": note
    };
    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> updatename(
      String first_name, String last_name, int user_id) async {
    String _url = '$endpoint/user/$user_id';

    var body = {"first_name": first_name, "last_name": last_name};
    return http.put(Uri.parse(_url), body: body);
  }

  Future<http.Response> getFoods() async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/foods';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> addFoodDetail(String food_name, String calorie) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/foodDetail';
    var body = {"food_name": food_name, "calorie": calorie};

    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> addFoodDetail1(int food_id, int user_id) async {
    // ignore:  no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/foodDetail/$user_id';
    var body = {
      "food_id": food_id,
    };

    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> getbloods(int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getbloodsAVG(int user_id, int year) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/avg/$year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getbloodsAVGYear(int user_id, int year) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/avgyear/$year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getbloodSesult(int user_id, int year) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/sum/$year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getYearBlood(int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getDescBlood(int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/blood/desc/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> updatBlood(String blood_level, int bloodId) async {
    String _url = '$endpoint/blood/$bloodId';

    var body = {
      "blood_level": blood_level,
    };
    return http.put(Uri.parse(_url), body: body);
  }

  Future<http.Response> getMedication(int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/medication/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getMedcationByMedcationId(
      int user_id, int medicationId) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/medication/$user_id/$medicationId';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> deleteMedication(int medicationId) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/medication/$medicationId';

    return http.delete(Uri.parse(_url));
  }

  Future<http.Response> updatMedication(
      String medication_name,
      String medication_amount,
      String medication_time,
      String note,
      int medicationId) async {
    String _url = '$endpoint/medication/$medicationId';

    var body = {
      "medication_name": medication_name,
      "medication_amount": medication_amount,
      "medication_time": medication_time,
      "note": note
    };
    return http.put(Uri.parse(_url), body: body);
  }

  Future<http.Response> updatNname(
      String first_name, String last_name, int user_id) async {
    String _url = '$endpoint/user/$user_id';

    var body = {"first_name": first_name, "last_name": last_name};
    return http.put(Uri.parse(_url), body: body);
  }

  Future<http.Response> addFood(String food_name, String calorie) async {
    String _url = '$endpoint/food';

    var body = {"food_name": food_name, "calorie": calorie};
    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> getFoodsAVG(int user_id, int year) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/food/avg/$year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getYearFood(int user_id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/food/year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> getfoodAVGYear(int user_id, int year) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _url = '$endpoint/food/avgyear/$year/$user_id';

    return http.get(Uri.parse(_url));
  }

  Future<http.Response> addfoodDetail2(
      int food_id, double calorie, int user_id) async {
    String _url = '$endpoint/foodDetail/$user_id';

    var body = {"food_id": food_id, "calorie": calorie};
    return http.post(Uri.parse(_url), body: body);
  }

  Future<http.Response> foodDetail(int food_id, int user_id) async {
    String _url = '$endpoint/foodDetail/$user_id/$food_id';

    // var body = {"food_id": food_id, "calorie": calorie};
    return http.post(Uri.parse(_url));
  }
}
