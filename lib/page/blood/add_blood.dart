import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_validate.dart';
import 'package:flutter_application/page/home.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBlood extends StatefulWidget {
  const AddBlood({super.key});

  @override
  State<AddBlood> createState() => _AddBloodState();
}

class _AddBloodState extends State<AddBlood> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController _ctrlBlood = TextEditingController();
  final TextEditingController _ctrlDate = TextEditingController();
  final TextEditingController _ctrlNote = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Apiprovider apiprovider = Apiprovider();
  Future addBlood() async {
    if (_formKey.currentState!.validate()) {}
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    var response = await apiprovider.addBlood(
        _ctrlBlood.text, _ctrlDate.text, _ctrlNote.text, user_id!);
    if (response.statusCode == 200) {
      print(response.body);
      // ignore: use_build_context_synchronously
      normalDialog(context, "title", "message");
      _formKey.currentState!.reset();
    }
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text(
                'เพิ่มระดับน้ำตาลในเลือด',
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.number,
                      controller: _ctrlBlood,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter blood sugar';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'ค่าน้ำตาล',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'วันที่',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1000),
                            lastDate: DateTime(2200));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          _ctrlDate.text = formattedDate;
                          //set output date to TextField value.
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: TextFormField(
                      controller: _ctrlNote,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter blood sugar';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'หมายเหตุ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                            child: const Text(
                              'บันทึก',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () => addBlood())),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0x82ff1111))),
                            child: const Text(
                              'ประวัติย้อนหลัง',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {})),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
