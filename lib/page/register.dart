import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_register.dart';
import 'package:intl/intl.dart';

import '../components/Dialog/dialog_code400.dart';

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
  // ignore: unused_field
  final TextEditingController _gender = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? gender;

  Apiprovider apiprovider = Apiprovider();

  Future doRegister() async {
    try {
      if (_formKey.currentState!.validate() && gender == null ||
          gender!.isEmpty) {
        dialogCode400(
            context, 'กรุณากรอกข้อมูลให้ครบ', 'กรุณากรอกข้อมูลให้ครบ');
      }

      var response = await apiprovider.doRegister(
          _ctrlUsername.text,
          _ctrlPassword.text,
          _ctrlFirstName.text,
          _ctrlLastName.text,
          _ctrlBirthday.text,
          gender!);

      if (response.statusCode == 200) {
        print(response.body);
        var jsonRes = json.decode(response.body);
        if (jsonRes['ok']) {
          print(jsonRes);
          // ignore: use_build_context_synchronously
          registerlDialog(context, 'สมัครสมาชิกสำเร็จ', 'สมัครสมาชิกสำเร็จ');
        } else {
          print(jsonRes['message']);
        }
      } else {
        print('Server Error');
      }
      // ignore: use_build_context_synchronously
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  void initState() {
    _ctrlBirthday.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x82ff1111),
        title: const Column(
          // ignore: prefer_const_literals_to_create_immutables
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                'สมัครสมาชิก',
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
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlUsername,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // normalDialog(
                          //     context, 'กรุณากรอกข้อมูลให้ครบ', 'ชื่อผู้ใช้');
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
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextFormField(
                      controller: _ctrlPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // normalDialog(
                          //     context, 'กรุณากรอกข้อมูลให้ครบ', 'รหัสผ่าน');
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextFormField(
                      controller: _ctrlFirstName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // normalDialog(
                          //     context, 'กรุณากรอกข้อมูลให้ครบ', 'ชื่อจริง');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'ชื่อจริง',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextFormField(
                      controller: _ctrlLastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // normalDialog(
                          //     context, 'กรุณากรอกข้อมูลให้ครบ', 'นามสกุล');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'นามสกุล',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextFormField(
                      controller: _ctrlBirthday,
                      validator: (value) {
                        if (value == null || value.isEmpty) {}
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'วันเกิด',
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
                // ignore: avoid_unnecessary_containers
                Container(
                    child: Column(
                  children: [
                    RadioListTile(
                      title: const Text("ชาย"),
                      value: "ชาย",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("หญิง"),
                      value: "หญิง",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                )),
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
                            child: const Text('ยืนยัน'),
                            onPressed: () => doRegister())),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
