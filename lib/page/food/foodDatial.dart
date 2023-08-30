import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/Api/api_provider.dart';
import 'package:flutter_application/model/FoodYearModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FoodChat.dart';

class FoodDatial extends StatefulWidget {
  const FoodDatial({super.key});

  @override
  State<FoodDatial> createState() => _FoodDatialState();
}

class _FoodDatialState extends State<FoodDatial> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getYearfood();
  }

  Apiprovider apiprovider = Apiprovider();
  late List<FoodYearModel?> foodyearModel;
  var jsonResponse = [];

  Future<List<FoodYearModel?>?> getYearfood() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      int? year = prefs.getInt('year');
      var response = await apiprovider.getYearFood(user_id!);
      if (response.statusCode == 200) {
        print(response.body);
        print("1");
        jsonResponse = jsonDecode(response.body);
        foodyearModel =
            jsonResponse.map((e) => FoodYearModel.fromJson(e)).toList();
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    return foodyearModel;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ประวัติระดับน้ำตาลในเลือด "),
        ),
        body: FutureBuilder(
          future: getYearfood(),
          builder: ((context, snapshot) {
            var data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: ((context, index) {
                      return SingleChildScrollView(
                          child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                    height: 65,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color(0xcc5286d4))),
                                        child: Text('ปี ${data?[index]?.year}'),
                                        onPressed: () async {
                                          final int? year = data?[index]?.year;
                                          print("${data?[index]?.year}");
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          await prefs.setInt('year', year!);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const FoodChart()));
                                        })),
                              ),
                            ),
                          ],
                        ),
                      ));
                    }),
                  ))
                ],
              );
            }
            return const LinearProgressIndicator();
          }),
        ));
  }
}
