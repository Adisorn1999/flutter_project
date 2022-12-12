import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider_authen.dart';
import 'package:flutter_application/components/drawer_menu.dart';
import 'package:flutter_application/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiproviderAuth apiproviderAuth = ApiproviderAuth();

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var rs = await apiproviderAuth.authen(token);
    // print(token);
    if (rs.statusCode == 200) {
      // ignore: unused_local_variable
      var jsonRs = json.decode(rs.body);
      print(jsonRs);
    }
  }

  // ignore: override_on_non_overriding_member
  @override
  void initState() {
    super.initState();
    getToken();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        drawer: const DrawerMane(),
        body: Container());
  }
}
