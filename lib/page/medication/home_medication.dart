import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_code200.dart';
import 'package:flutter_application/page/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../components/Dialog/dialog_addMedication.dart';
import '../../model/medicationModel.dart';
import 'medication_edit.dart';
import 'medication_view.dart';

enum _MenuValues { settings, page, delete }

class HomeMedication extends StatefulWidget {
  const HomeMedication({super.key});

  @override
  State<HomeMedication> createState() => _HomeMedicationState();
}

class _HomeMedicationState extends State<HomeMedication> {
  @override
  final _formKey = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    super.initState();

    getMedication();
  }

  Apiprovider apiprovider = Apiprovider();
  late List<MedicationModel?> medicationModel;

  var jsonResponse = [];
  bool loading = true;
  late List<MedicationModel> dataMedication = [];
  var formatter = DateFormat.yMd();

  Future<List<MedicationModel?>?> getMedication() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      var response = await apiprovider.getMedication(user_id!);
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);

        medicationModel =
            jsonResponse.map((e) => MedicationModel.fromJson(e)).toList();
        // List<MedicationModel> jsonResponse =
        //     medicationModelFromJson(response.body).toList();
        // dataMedication = jsonResponse;
        loading = false;
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    return medicationModel;
  }

  final TextEditingController _ctrlMedicationName = TextEditingController();
  final TextEditingController _ctrlMedicationAmount = TextEditingController();
  final TextEditingController _ctrlMedicationTime = TextEditingController();
  final TextEditingController _ctrlMedicationNote = TextEditingController();

  Future updataMedication() async {
    final prefs = await SharedPreferences.getInstance();
    final int? medicationId = prefs.getInt('medicationId');
    if (_formKey.currentState!.validate()) {
      var response = await apiprovider.updatMedication(
          _ctrlMedicationName.text,
          _ctrlMedicationAmount.text,
          _ctrlMedicationTime.text,
          _ctrlMedicationNote.text,
          medicationId!);
      if (response.statusCode == 200) {
        setState(() {
          print(response.body);
          Navigator.of(context).pop();
        });
      }
    }
  }

  // ignore: unused_element
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
                TextFormField(
                  controller: _ctrlMedicationName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่ชื่อยา';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "ชื่อยา"),
                  autocorrect: false,
                ),
                TextFormField(
                  controller: _ctrlMedicationAmount,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่ปริมาณ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "ปริมาณ"),
                  autocorrect: false,
                ),
                TextFormField(
                  controller: _ctrlMedicationTime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่เวลาที่ใช้';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "เวลาที่ใช้"),
                  autocorrect: false,
                ),
                TextFormField(
                  controller: _ctrlMedicationNote,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาใส่หมายเหตุ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "หมายเหตุ"),
                  autocorrect: false,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: const Text('SAVE'), onPressed: () => updataMedication()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("data"),
        ),
        body: FutureBuilder(
          future: getMedication(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          title: Wrap(
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "ชื่อยา ${data?[index]?.medicationName}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "เวลาใช้ยา ${data?[index]?.medicationTime}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "วันที่เพิ่มยา ${formatter.format(data?[index]?.time)}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: _MenuValues.page,
                                child: Text("ดูข้อมูลยา"),
                              ),
                              const PopupMenuItem(
                                value: _MenuValues.settings,
                                child: Text("แก้ไขข้อมูลยา"),
                              ),
                              const PopupMenuItem(
                                value: _MenuValues.delete,
                                child: Text("ลบข้อมูลยา"),
                              )
                            ],
                            onSelected: (value) async {
                              switch (value) {
                                case _MenuValues.page:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) =>
                                          const MedicationVeiw())));
                                  final int? medicationId =
                                      data?[index]?.medicationId;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'medicationId', medicationId!);
                                  break;
                                case _MenuValues.settings:
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: ((context) =>
                                  //         const MedicationEdit())));
                                  final int? medicationId =
                                      data?[index]?.medicationId;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'medicationId', medicationId!);

                                  _showDialog(context);

                                  break;
                                case _MenuValues.delete:
                                  deleteMedicationlDialog(
                                      context, "ลบสำเร็จ", "ลบสำเร็จ");
                                  final int? medicationId =
                                      data?[index]?.medicationId;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'medicationId', medicationId!);
                              }
                            },
                          ),
                          onTap: () async {
                            print("${data?[index]?.medicationId}");
                            print("${data?[index]?.medicationName}");
                            final int? medicationId =
                                data?[index]?.medicationId;
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setInt('medicationId', medicationId!);
                            // ignore: use_build_context_synchronously
                            addMedicationlDialog(context, "title", "message");
                          },
                          // leading: Icon(Icons.food_bank),
                        ),
                      );
                    }),
                  ))
                ],
              );
            }
            return const LinearProgressIndicator();
          },
        ));
  }

  Future<void> deleteMedicationlDialog(
      BuildContext context, String title, String message) async {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('ยกเลิก'),
                ),
                TextButton(
                    child: const Text("ตกลง"),
                    onPressed: () async {
                      setState(() {
                        Navigator.pop(context, 'ok');
                        deleteMedication();
                      });
                    }),
              ],
            )));
  }

  Future<void> deleteMedication() async {
    final prefs = await SharedPreferences.getInstance();
    final int? medicationId = prefs.getInt('medicationId');

    var response = await apiprovider.deleteMedication(medicationId!);
    if (response.statusCode == 200) {
      print(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('medicationId', medicationId);
    }
  }
}
