import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/page/home.dart';
import 'package:intl/intl.dart';

class Addblood extends StatefulWidget {
  const Addblood({super.key});

  @override
  State<Addblood> createState() => _AddbloodState();
}

class _AddbloodState extends State<Addblood> {
  final TextEditingController _ctrlBlood = TextEditingController();
  final TextEditingController _ctrlDate = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Apiprovider apiprovider = Apiprovider();
  Future addBlood() async {
    if (_formKey.currentState!.validate()) {}
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
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2200));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            _ctrlDate.text =
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
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: TextFormField(
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
                            onPressed: () => addBlood())),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
