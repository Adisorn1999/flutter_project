// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/page/home.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/api_provider.dart';
import '../../model/UserModel.dart';
import 'edit/editName.dart';
import 'edit_name.dart';

enum _MenuValues { editName }

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var formatter = DateFormat.yMd();
  Apiprovider apiprovider = Apiprovider();
  UserModel? _userModel;
  Future<UserModel?> getdata() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: FutureBuilder(
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const SizedBox(
                          height: 130,
                          width: 130,
                          child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: FlutterLogo(size: 40)),
                        ),
                      ),
                    ),
                    Center(
                      child: Card(
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ignore: avoid_unnecessary_containers
                            ListTile(
                              leading: Icon(Icons.account_box),
                              title: Text(
                                  "ชื่อ : ${snapshot.data.firstName} ${snapshot.data.lastName}"),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: _MenuValues.editName,
                                    child: Text("เปลี่ยนชื่อ"),
                                  ),
                                ],
                                onSelected: (value) async {
                                  switch (value) {
                                    case _MenuValues.editName:
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const EditName1())));
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ListTile(
                              leading: Icon(Icons.favorite),
                              title: Text(
                                  // ignore: unnecessary_string_interpolations
                                  "วันเดือนปีเกิด : ${formatter.format(snapshot.data.birthday)}"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(Icons.favorite),
                              title: Text("อายุ : ${snapshot.data.year} "),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: Icon(Icons.favorite),
                              title: Text("เพศ : ${snapshot.data.gender} "),
                            ),

                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const LinearProgressIndicator();
            }));
  }
}
