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
                        leading: const Icon(Icons.edit),
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

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_application/API/api_provider.dart';
// import 'package:flutter_application/model/blood_chart_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// import '../../model/bar_chart_model.dart';

// class BloodChart extends StatefulWidget {
//   const BloodChart({super.key});

//   @override
//   State<BloodChart> createState() => _BloodChartState();
// }

// class _BloodChartState extends State<BloodChart> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getBloods();
//   }

//   Apiprovider apiprovider = Apiprovider();
//   late List<BarChartModel?> barChartModel;
//   var jsonResponse = [];
//   bool loading = true;
//   late List<BarChartModel> data = [];

//   Future<List<BarChartModel?>?> getBloods() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final int? user_id = prefs.getInt('userId');
//       final int? year = prefs.getInt('year');
//       var response = await apiprovider.getbloodsAVG(user_id!, year!);
//       if (response.statusCode == 200) {
//         print(response.body);
//         // jsonResponse = jsonDecode(response.body);
//         List<BarChartModel> tempdata = barChartModelFromJson(response.body);
//         setState(() {
//           data = tempdata;
//           loading = false;
//         });
//       }
//     } on Exception catch (e) {
//       // TODO
//     }
//     return data;
//   }

//   List<charts.Series<BarChartModel, String>> _createSampleData() {
//     return [
//       charts.Series<BarChartModel, String>(
//         data: data,
//         id: 'sales',
//         colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
//         domainFn: (BarChartModel barChartModel, _) =>
//             barChartModel.month.toString(),
//         measureFn: (BarChartModel barChartModel, _) =>
//             barChartModel.averageBlood?.toDouble(),
//       )
//     ];
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ประวัติระดับน้ำตาลในเลือดปี"),
//       ),
//       body: Center(
//         child: loading
//             ? CircularProgressIndicator()
//             : Container(
//                 height: 300,
//                 child: charts.BarChart(
//                   _createSampleData(),
//                   animate: true,
//                 ),
//               ),
//       ),
//     );
//   }
// }

