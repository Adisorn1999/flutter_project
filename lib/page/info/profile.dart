import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/Dialog/dialog_validate.dart';
import '../../model/UserModel.dart';

enum _MenuValues { editName }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  final _formKey = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
  }

  var formatter = DateFormat.yMd();
  Apiprovider apiprovider = Apiprovider();
  //UserModel? _userModel;

  Future<UserModel?> getDataUser() async {
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    var responseGetDataUser = await apiprovider.getUserById(user_id!);
    print(user_id);
    if (responseGetDataUser.statusCode == 200) {
      // ignore: unused_local_variable
      print(responseGetDataUser.body);
      var jsonresresponse = jsonDecode(responseGetDataUser.body);
      return UserModel.fromJson(jsonresresponse[0]);
    }
  }

  final TextEditingController _ctrlFirstName = TextEditingController();
  final TextEditingController _ctrlLastName = TextEditingController();

  Future updateName() async {
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    if (_formKey.currentState!.validate()) {
      var responseUpdateName = await apiprovider.updatename(
          _ctrlFirstName.text, _ctrlLastName.text, user_id!);
      if (responseUpdateName.statusCode == 200) {
        setState(() {
          print(responseUpdateName.body);
          Navigator.of(context).pop();
        });
        normalDialog(context, "บันทึกสำเร็จ", "");
        _formKey.currentState!.reset();
      }
    }
  }

  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('ชื่อใหม่ของคุณ'),
  //         content: Form(
  //           key: _formKey,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               TextFormField(
  //                 controller: _ctrlFirstName,
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'กรุณาใส่ปริมาณ (กิโลเเคลอรี่)';
  //                   }
  //                   return null;
  //                 },
  //                 decoration: const InputDecoration(hintText: "ชื่อ "),
  //                 autocorrect: false,
  //               ),
  //               TextFormField(
  //                 controller: _ctrlLastName,
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'กรุณาใส่ปริมาณ (กิโลเเคลอรี่)';
  //                   }
  //                   return null;
  //                 },
  //                 decoration: const InputDecoration(hintText: "นามสกุล "),
  //                 autocorrect: false,
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('CANCEL'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //               child: const Text('SAVE'), onPressed: () => updateName()),
  //         ],
  //       );
  //     },
  //   );
  // }
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ชื่อใหม่ของคุณ'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: TextFormField(
                    controller: _ctrlFirstName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ชื่อ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "ชื่อ"),
                    autocorrect: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  child: TextFormField(
                    controller: _ctrlLastName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่นามสกุล)';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "นามสกุล"),
                    autocorrect: false,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: const Text('ตกลง'), onPressed: () => updateName()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ข้อมูลผู้ใช้งาน"),
        ),
        body: FutureBuilder(
            future: getDataUser(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 130,
                          width: 130,
                          child: CircleAvatar(
                              backgroundColor: Colors.black,
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
                              leading: const Icon(Icons.account_box),
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
                                      _showDialog(context);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ListTile(
                              leading: const Icon(Icons.favorite),
                              title: Text(
                                  // ignore: unnecessary_string_interpolations
                                  "วันเดือนปีเกิด : ${formatter.format(snapshot.data.birthday)}"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: const Icon(Icons.favorite),
                              title: Text("อายุ : ${snapshot.data.year} ปี"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: const Icon(Icons.favorite),
                              title: Text("เพศ : ${snapshot.data.gender} "),
                            ),
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
