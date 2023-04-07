import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/page/info/edit_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/UserModel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                return Center(
                  child: Card(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: const SizedBox(
                            height: 130,
                            width: 130,
                            // ignore: prefer_const_constructors
                            child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: FlutterLogo(size: 40)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                                height: 65,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xcc5286d4))),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.account_box),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Expanded(
                                            child: Text(
                                                "${snapshot.data.firstName} ${snapshot.data.lastName}")),
                                        const Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Editname()));
                                    })),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("อายุ :"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${snapshot.data.year}"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("ปี"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("เพศ : "),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${snapshot.data.gender}"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const LinearProgressIndicator();
            }));
  }
}
