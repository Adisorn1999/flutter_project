// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/model/blood_chart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../API/api_provider_authen.dart';
import '../../model/BloodYearModel.dart';
import '../../model/avg_blood_allyear.dart';
import '../../model/bar_chart_model.dart';

class BloodChart extends StatefulWidget {
  const BloodChart({super.key});

  @override
  State<BloodChart> createState() => _BloodChartState();
}

class _BloodChartState extends State<BloodChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloods();
    print("object");
  }

  Apiprovider apiprovider = Apiprovider();
  late List<BarChartModel?> barChartModel = [];
  var jsonResponse = [];
  bool loading = true;
  late List<BarChartModel> data = [];

  Future<List<BarChartModel?>?> getBloods() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      int? year = prefs.getInt('year');

      var response = await apiprovider.getbloodsAVG(user_id!, year!);
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);
        data = jsonResponse.map((e) => BarChartModel.fromJson(e)).toList();
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

  AvgBloodAllYear? avgAllYear;

  Future<AvgBloodAllYear?> getYear() async {
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    int? year = prefs.getInt('year');
    var response = await apiprovider.getbloodsAVGYear(user_id!, year!);
    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      avgAllYear = AvgBloodAllYear.fromJson(jsonResponse[0]);
    }
    return avgAllYear;
  }

  List<charts.Series<BarChartModel, String>> _createSampleData() {
    return [
      charts.Series<BarChartModel, String>(
        data: data,
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (BarChartModel barChartModel, _) =>
            barChartModel.month.toString(),
        measureFn: (BarChartModel barChartModel, _) =>
            barChartModel.averageBlood?.toDouble(),
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
                        "ประวัติระดับน้ำตาลในเลือดปี ${snapshot.data.year ?? "..."}",
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
                          "ค่าเฉลี่ยระดับน้ำตาลในเลือดตลอดปี : ${snapshot.data.averageBlood.toStringAsFixed(2) ?? "..."}"),
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
