import 'dart:convert';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/model/Foodsmodel.dart';

import '../../model/search.dart';
import 'addFood_detail.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initStateuper.initState();

    // getFoods();
  }

  void _incrementCounter() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddFoodDetail()));
  }

  double sizeBoxSearch = 0;
  late List<FoodsModel?> _foodsModel;
  List<Search> _data = [];
  List<Search> _foundUsers = [];

  var jsonResponse = [];
  final _ctrlSearch = TextEditingController();

  Apiprovider apiprovider = Apiprovider();

  Future<List<FoodsModel?>?> getFoods() async {
    var response = await apiprovider.getFoods();
    try {
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);
        _foodsModel = jsonResponse.map((e) => FoodsModel.fromJson(e)).toList();
        for (int i = 0; i < _foodsModel.length; i++) {
          // ignore: unnecessary_new
          Search data = new Search(
              foodId: _foodsModel[i]!.foodId,
              foodName: _foodsModel[i]!.foodName);
          _data.add(data);
        }
      } else {
        print("Api error");
      }
    } on Exception catch (e) {
      // TODO
      print('error $e');
    }
    return _foodsModel;
  }

  void _runFilter(String enteredKeyword) {
    print("_runFilter");
    List<Search> results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        sizeBoxSearch = 0;
      });
    } else {
      sizeBoxSearch = 500;

      results = _data
          .where((user) => user.foodName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print("123");
    }
    // setstate เพื่อทำการ Refresh  UI 😁

    _foundUsers = results;
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _ctrlSearch,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'รายการอาหาร',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  const BorderSide(color: Colors.black))),
                      onChanged: (value) => _runFilter(value),
                    ),
                  ),
                ),
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
    // This trailing comma makes auto-forma);
  }
}
