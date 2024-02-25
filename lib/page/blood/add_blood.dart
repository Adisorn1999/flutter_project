// ignore_for_file: use_build_context_synchronously, avoid_unnecessary_containers, non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_validate.dart';
import 'package:flutter_application/page/blood/blood_charts.dart';
import 'package:flutter_application/page/blood/home_blood_charts.dart';
import 'package:flutter_application/page/home.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/model/desc_blood,dart';

import '../../components/Dialog/dialog_code200.dart';
import '../../components/Dialog/dialog_code400.dart';

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
    // getDescBlood();
  }

  final TextEditingController _ctrlBlood = TextEditingController();
  final TextEditingController _ctrlDate = TextEditingController();
  final TextEditingController _ctrlNote = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var jsonResponseAdd = [];
  var jsonResponseGet = [];

  late List<BloodDecStModel?> _bloodDecStModel;
  Apiprovider apiprovider = Apiprovider();
  Future addBlood() async {
    try {
      if (_formKey.currentState!.validate()) {}
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');

      var responseAdd = await apiprovider.addBlood(
          _ctrlBlood.text, _ctrlDate.text, _ctrlNote.text, user_id!);

      var responseGet = await apiprovider.getDescBlood(user_id);

      _formKey.currentState!.reset();
      dialogAddBlood(context, "", "");
      // Navigator.pop(context, 'ok');

      if (responseGet.statusCode == 200) {
        print(responseGet.body);

        jsonResponseGet = jsonDecode(responseGet.body);
        _bloodDecStModel =
            jsonResponseGet.map((e) => BloodDecStModel.fromJson(e)).toList();
        print(_bloodDecStModel[0]?.bloodLevel);
        double? blood_level = _bloodDecStModel[0]?.bloodLevel;
        print(blood_level);
        await prefs.setDouble('blood_level', blood_level!);
      }
      await prefs.remove('blood_level');
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<List<BloodDecStModel?>?> getDescBlood() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');

      var response = await apiprovider.getDescBlood(user_id!);
      print(user_id);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
    return _bloodDecStModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0x82ff1111),
        title: const Column(
          // ignore: prefer_const_literals_to_create_immutables
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
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
                const SizedBox(
                  height: 50,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
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
                            child: const Text(
                              'บันทึก',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              addBlood();
                            })),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: const Text(
                              'รายงานระดับน้ำตาลในเลือด',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeBlood()));
                            })),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Future<void> dialogAddBlood(
    BuildContext context, String title, String message) async {
  final prefs = await SharedPreferences.getInstance();
  final int? user_id = prefs.getInt('userId');
  final double? blood_level = prefs.getDouble('blood_level');

  if (blood_level! < 70) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("ระดับน้ำตาลในเลือดคุณอยู่ในภาวะต่ำ"),
              content: const Text(
                  "ภาวะน้ำตาลในเลือดต่ำ คือภาวะที่ระดับน้ำตาลในเลือดต่ำกว่า 70 มิลลิกรัมต่อเดซิลิตร หรือ 3.9 มิลลิโมลต่อลิตรในผู้ป่วยเบาหวาน หรือต่ำกว่า 55 มิลลิกรัมต่อเดซิลิตร หรือ 3.1 มิลลิโมลต่อลิตรในคนทั่วไป เมื่อมีอาการ ควรรีบรับประทานอาหารหรือเครื่องดื่มหวาน ๆ ทันที เพื่อป้องกันไม่ให้เกิดภาวะน้ำตาลในเลือดต่ำรุนแรง ซึ่งเป็นอันตราย"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final int? user_id = prefs.getInt('userId');
                    await prefs.remove('blood_level');
                    Navigator.pop(context, 'ok');
                  },
                  child: const Text('ตกลง'),
                ),
              ],
            )));
  }
  if (blood_level >= 70 && blood_level < 125) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("ระดับน้ำตาลในเลือดคุณอยู่ในภาวะปกติ"),
              content: const Text(
                  "ระดับน้ำตาลที่ปกติ จะอยู่ที่ประมาณ 70-100 มิลลิกรัมต่อเดซิลิตร แต่หากค่าที่ได้สูงกว่า 100 มิลลิกรัมต่อเดซิลิตร ขึ้นไปอาจเสี่ยงต่อการเป็นโรคเบาหวาน"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final int? user_id = prefs.getInt('userId');
                    await prefs.remove('blood_level');
                    Navigator.pop(context, 'ok');
                  },
                  child: const Text('ตกลง'),
                ),
              ],
            )));
  }
  if (blood_level > 125) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text(
                  "ระดับน้ำตาลในเลือดคุณมีภาวะความเสี่ยง หรือเรียกว่า เบาหวานแฝง"),
              content: const Text(
                  " ถือว่ามีความเสี่ยงต่อการเป็นโรคเบาหวาน แพทย์อาจแนะนำในด้านการปรับเปลี่ยนพฤติกรรม เช่น การคุมอาหาร ลดน้ำหนัก และออกกำลังกาย เพื่อป้องกันการเป็นเบาหวานในอนาคต"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final int? user_id = prefs.getInt('userId');
                    await prefs.remove('blood_level');
                    Navigator.pop(context, 'ok');
                  },
                  child: const Text('ตกลง'),
                ),
              ],
            )));
  }
}
