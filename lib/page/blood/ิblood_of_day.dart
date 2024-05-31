import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/api_provider.dart';
import '../../model/blood_result.dart';
import '../../model/desc_blood,dart';

enum _MenuValues { editblood }

class BloodOfDay extends StatefulWidget {
  const BloodOfDay({super.key});

  @override
  State<BloodOfDay> createState() => _BloodOfDayState();
}

class _BloodOfDayState extends State<BloodOfDay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloods();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlBlood = TextEditingController();

  var formatter = DateFormat.yMd();
  var now = DateTime.now();
  bool loading = true;
  late List<BloodResult?> bloodDecStModel;

  late List<BloodResult?> data = [];
  var jsonResponse = [];
  Apiprovider apiprovider = Apiprovider();

  Future<List<BloodResult?>?> getBloods() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      int? year = prefs.getInt('year');

      var response = await apiprovider.getbloodSesult(user_id!, year!);
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);
        data = jsonResponse.map((e) => BloodResult.fromJson(e)).toList();
        // List<BarChartModel> jsonResponse =
        //     barChartModelFromJson(jsonDecode(response.body));
        // data = jsonResponse;
        loading = false;
      } else {
        print("api error");
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      // TODO
      print("error $e");
    }
    return data;
  }

  Future updateblood() async {
    final prefs = await SharedPreferences.getInstance();
    final int? bloodId = prefs.getInt('bloodId');
    if (_formKey.currentState!.validate()) {
      var response = await apiprovider.updatBlood(_ctrlBlood.text, bloodId!);
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).pop();
        updateMedicationlDialog(context, "สำเร็จ", "แก้ไขสำเร็จ");
      }
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ระดับน้ำตาลในเลือด'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    keyboardType: TextInputType.number,
                    controller: _ctrlBlood,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ค่าน้ำตาล';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "ค่าน้ำตาล"),
                    autocorrect: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                child: const Text('ตกลง'), onPressed: () => updateblood()),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ระดับน้ำตาลในเลือด"),
        ),
        body: FutureBuilder(
          future: getBloods(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              return Container(
                child: const LinearProgressIndicator(),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: ((context, index) {
                          final blood = data?[index];
                          var time = data?[index]?.bloodTime;
                          return Card(
                              child: ListTile(
                            title: Row(
                              children: [
                                // Container(
                                //   height: 60,
                                //   width: 60,
                                //   decoration: BoxDecoration(
                                //       color: Colors.red,
                                //       borderRadius: BorderRadius.circular(10)),
                                //   child: Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         Text(
                                //           "${data?[index]?.bloodId}",
                                //           style: const TextStyle(
                                //               fontSize: 16.5,
                                //               fontWeight: FontWeight.bold,
                                //               color: Colors.white),
                                //         ),
                                //       ]),
                                // ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        " ${formatter.format(time!)}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ระดับน้ำตาล ${data?[index]?.bloodLevel}  ",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                            onTap: () async {
                              print("${data?[index]?.bloodId}");

                              // blood200(context, "สำเร็จ", "แก้ไขสำเร็จ");
                            },
                            trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: _MenuValues.editblood,
                                  child: Text("แก้ไขระดับน้ำตาล"),
                                ),
                              ],
                              onSelected: (value) async {
                                final int? bloodId = data?[index]?.bloodId;
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setInt('bloodId', bloodId!);
                                switch (value) {
                                  case _MenuValues.editblood:
                                    _showDialog(context);
                                }
                              },
                            ),
                          ));
                        })))
              ],
            );
          },
        ));
  }

  Future<void> updateMedicationlDialog(
      BuildContext context, String title, String message) async {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                    child: const Text("ตกลง"),
                    onPressed: () async {
                      setState(() {
                        Navigator.pop(context, 'ok');
                      });
                    }),
              ],
            )));
  }
}
