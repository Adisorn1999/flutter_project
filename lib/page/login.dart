// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application/API/api_provider_authen.dart';
import 'package:flutter_application/Api/api_provider.dart';
import 'package:flutter_application/model/TKUserModel.dart';
import 'package:flutter_application/page/home.dart';
import 'package:flutter_application/page/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: depend_on_referenced_packages

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initSatate() async {
    super.initState();
  }

  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Apiprovider apiprovider = Apiprovider();
  ApiproviderAuth apiproviderAuth = ApiproviderAuth();

  Future dologin() async {
    if (_formKey.currentState!.validate()) {}
    try {
      var rs =
          await apiprovider.doLogin(_ctrlUsername.text, _ctrlPassword.text);
      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        if (jsonRes['ok']) {
          // print(jsonRes);
          final String token = jsonRes['token'];
          //print(token);
          // ignore: unused_local_variable
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          print(jsonRes);
        }
      } else {
        print('Server Error');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 270,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
                    child: Image.asset(
                      'assets/rectangle-13.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _ctrlUsername,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _ctrlPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Row(
                  // ignore: sort_child_properties_last
                  children: [
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 120),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0x82ff1111))),
                            child: Text('Login'),
                            onPressed: () => dologin())),
                  ),
                ),
                Row(
                  // ignore: sort_child_properties_last
                  children: [
                    Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          )),
    );
  }
}
