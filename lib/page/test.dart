import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';

import '../model/Foodsmodel.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFoods();
  }

  Apiprovider _apiprovider = Apiprovider();

  String searchValue = '';
  late List<FoodsModel?> _foodsModel = [];

  Future<List<FoodsModel?>?> getFoods() async {
    var response = await _apiprovider.getFoods();
    try {
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = jsonDecode(response.body);
        _foodsModel = jsonResponse.map((e) => FoodsModel.fromJson(e)).toList();
      } else {
        print("Api error");
      }
    } on Exception catch (e) {
      // TODO
      print('error $e');
    }
    return _foodsModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("เพิ่มรายการอาหาร"),
        ),
        body: FutureBuilder(
          future: getFoods(),
          builder: ((context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: const LinearProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: ((context, index) {
                    final food = data?[index];
                    return Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${data?[index]?.foodId}",
                                      style: const TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "${data?[index]?.foodName}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "${data?[index]?.calorie} กิโลเเคลอรี่",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                        onTap: () {
                          print("${data?[index]?.foodName}");
                        },
                        // leading: Icon(Icons.food_bank),
                      ),
                    );
                  }),
                ))
              ],
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }

  void _incrementCounter() {}
}
