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
        title: const Text('DSME'),
      ),
      drawer: const DrawerMane(),
      body: Center(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 70,
              width: double.infinity,
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: const Text("Hello",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: Image.asset(
                        'assets/ellipse-1-bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 280,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: const Text('confirm'),
                                onPressed: () {})),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: Image.asset(
                        'assets/ellipse-2-bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 280,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: const Text('confirm'),
                                onPressed: () {})),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: Image.asset(
                        'assets/ellipse-3-bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 280,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: const Text('confirm'),
                                onPressed: () {})),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: Image.asset(
                        'assets/ellipse-1-bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 280,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: const Text('confirm'),
                                onPressed: () {})),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
