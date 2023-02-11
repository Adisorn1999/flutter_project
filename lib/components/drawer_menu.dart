import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_logout.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/model/UserModel.dart';
import 'package:flutter_application/page/home.dart';
import 'package:flutter_application/page/info/profile.dart';
import 'package:flutter_application/page/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../API/api_provider_authen.dart';

class DrawerMane extends StatefulWidget {
  const DrawerMane({super.key});

  @override
  State<DrawerMane> createState() => _DrawerManeState();
}

class _DrawerManeState extends State<DrawerMane> {
  @override
  void initState() {
    super.initState();
  }

  Apiprovider apiprovider = Apiprovider();
  UserModel? _userModel;
  Future<UserModel?> getdata() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      var response = await apiprovider.getUserById(user_id!);
      print(user_id);
      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        print(response.body);
        var jsonresresponse = jsonDecode(response.body);
        return UserModel.fromJson(jsonresresponse[0]);
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdata(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
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
                  accountName: Text(
                      "${snapshot.data.firstName} ${snapshot.data.lastName}"),
                  accountEmail: Text("${snapshot.data.username}"),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: FlutterLogo(size: 40),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('หน้าแรก'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_box),
                  title: const Text('ข้อมูลส่วนตัว'),
                  onTap: () {
                    // Update the state of the app.
                    // ... Navigator.of(context).push(
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Profile()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.badge),
                  title: const Text('หน้าแรก'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const SearchBarScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('ออกจากระบบ'),
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('token');
                    await prefs.remove('userId');
                    // ignore: use_build_context_synchronously
                    logoutDialog(context, 'ออกจากระบบ', 'ออกจากระบบ');
                  },
                ),
              ],
            ),
          );
        }
        return LinearProgressIndicator();
      },
    );
  }
}
