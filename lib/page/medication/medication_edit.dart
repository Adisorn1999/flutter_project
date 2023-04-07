import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/api_provider.dart';
import '../../model/MedicationUserModel.dart';

class MedicationEdit extends StatefulWidget {
  const MedicationEdit({super.key});

  @override
  State<MedicationEdit> createState() => _MedicationEditState();
}

class _MedicationEditState extends State<MedicationEdit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getMedcationByMedcationId();
  }

  Apiprovider apiprovider = Apiprovider();
  var formatter = DateFormat.yMd();
  MedicationUserModel? medicationUserModel;
  var jsonResponse = [];
  Future<MedicationUserModel?> getMedcationByMedcationId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    final int? medicationId = prefs.getInt('medicationId');

    var response =
        await apiprovider.getMedcationByMedcationId(user_id!, medicationId!);
    if (response.statusCode == 200) {
      print(response.body);
      jsonResponse = jsonDecode(response.body);
      medicationUserModel = MedicationUserModel.fromJson(jsonResponse[0]);
    }
    return medicationUserModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ข้อมูลยา"),
      ),
      body: FutureBuilder(
          future: getMedcationByMedcationId(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
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
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            " ชื่อยา : ${snapshot.data.medicationName ?? "..."}")),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const Editname()));
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            " ปริมาณยาที่ใช้  : ${snapshot.data.medicationAmount ?? "..."}")),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const Editname()));
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            "เวลาที่ใช้ยา : ${snapshot.data.medicationTime ?? "..."}")),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const Editname()));
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            "วันที่เพิ่มยา : ${formatter.format(snapshot.data.time ?? "...")}")),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const Editname()));
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            " หมายเหตุ : ${snapshot.data.note ?? "..."}")),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const Editname()));
                                })),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }
            return const LinearProgressIndicator();
          }),
    );
  }
}
