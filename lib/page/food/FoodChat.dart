import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../model/avg_food_allyear.dart';
import '../../model/food_bar_chart_model.dart';

class FoodChart extends StatefulWidget {
  const FoodChart({super.key});

  @override
  State<FoodChart> createState() => _FoodChartState();
}

class _FoodChartState extends State<FoodChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloods();
    print("object");
  }

  Apiprovider apiprovider = Apiprovider();
  late List<FoodBarchartModel?> barChartModel = [];
  var jsonResponse = [];
  bool loading = true;
  late List<FoodBarchartModel> data = [];

  Future<List<FoodBarchartModel?>?> getBloods() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      int? year = prefs.getInt('year');

      var response = await apiprovider.getFoodsAVG(user_id!, year!);
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);
        data = jsonResponse.map((e) => FoodBarchartModel.fromJson(e)).toList();
        // List<BarChartModel> jsonResponse =
        //     barChartModelFromJson(jsonDecode(response.body));
        // data = jsonResponse;
        loading = false;
      }
    } on Exception catch (e) {
      // TODO
    }
    return data;
  }

  AvgFoodAllYear? avgAllYear;
  Future<AvgFoodAllYear?> getYear() async {
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    int? year = prefs.getInt('year');
    var response = await apiprovider.getfoodAVGYear(user_id!, year!);
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      avgAllYear = AvgFoodAllYear.fromJson(jsonResponse[0]);
    }
    return avgAllYear;
  }

  List<charts.Series<FoodBarchartModel, String>> _createSampleData() {
    return [
      charts.Series<FoodBarchartModel, String>(
        data: data,
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (FoodBarchartModel barChartModel, _) =>
            barChartModel.month.toString(),
        measureFn: (FoodBarchartModel barChartModel, _) =>
            barChartModel.avgFoodCalorie.toDouble(),
      )
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" "),
        ),
        // ignore: prefer_const_constructors
        body: FutureBuilder(
          future: getYear(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "ประวัติระดับน้ำตาลในเลือดปี${snapshot.data.year ?? "..."}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: charts.BarChart(
                        _createSampleData(),
                        animate: true,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text(
                          "ค่าเฉลี่ยระดับน้ำตาลในเลือดตลอดปี : ${snapshot.data.averageCalorie.toStringAsFixed(2) ?? "..."}"),
                    )
                  ],
                ),
              );
            }
            return const LinearProgressIndicator();
          },
        ));
  }
}
