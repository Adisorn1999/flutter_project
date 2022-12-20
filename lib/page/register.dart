import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/API/api_provider_authen.dart';
import 'package:flutter_application/page/home.dart';
import 'package:flutter_application/page/login.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlFirstName = TextEditingController();
  final TextEditingController _ctrlLastName = TextEditingController();
  final TextEditingController _ctrlBirthday = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Apiprovider apiprovider = Apiprovider();

  Future doRegister() async {
    if (_formKey.currentState!.validate()) {}
    try {
      var rs = await apiprovider.doRegister(
          _ctrlUsername.text,
          _ctrlPassword.text,
          _ctrlFirstName.text,
          _ctrlLastName.text,
          _ctrlBirthday.text);

      if (rs.statusCode == 200) {
        print(rs.body);
        var jsonRes = json.decode(rs.body);
        if (jsonRes['ok']) {
          print(jsonRes);
          // ignore: use_build_context_synchronously
          Navigator.of(context)
              .pop(MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {
          print(jsonRes['message']);
        }
      } else {
        print('Server Error');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void initState() {
    _ctrlBirthday.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x82ff1111),
        title: Column(
          // ignore: prefer_const_literals_to_create_immutables
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 10, 10, 10),
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
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
                          labelText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlFirstName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlLastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Last Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlBirthday,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Birthdat';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'Birthday',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2200));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            _ctrlBirthday.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0x82ff1111))),
                            child: const Text('confirm'),
                            onPressed: () => doRegister())),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
