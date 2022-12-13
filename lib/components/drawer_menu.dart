import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../API/api_provider_authen.dart';

class DrawerMane extends StatefulWidget {
  const DrawerMane({super.key});

  @override
  State<DrawerMane> createState() => _DrawerManeState();
}

class _DrawerManeState extends State<DrawerMane> {
  void initSatate() async {
    super.initState();
    getToken();
  }

  ApiproviderAuth apiproviderAuth = ApiproviderAuth();

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var rs = await apiproviderAuth.authen(token);
    print(token);
    if (rs.statusCode == 200) {
      // ignore: unused_local_variable
      var jsonRs = json.decode(rs.body);
      if (jsonRs['ok']) {}
      print(jsonRs);
      final String username = jsonRs['username'];
      print(username);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. fThis ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // ignore: prefer_const_constructors
          UserAccountsDrawerHeader(
            accountName: const Text("adisorn123"),
            accountEmail: const Text("adisorn123"),
            currentAccountPicture: const CircleAvatar(
              child: FlutterLogo(size: 40),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('หน้าแรก'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('ข้อมูลส่วนตัว'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('ออกจากระบบ'),
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
