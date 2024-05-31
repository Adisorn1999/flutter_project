import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../API/api_provider.dart';
import '../../model/blood_result.dart';
import '../../model/test_barchart_mode;.dart';

Apiprovider apiprovider = Apiprovider();
late List<BloodResult?> barChartModel = [];
var jsonResponse = [];
bool loading = true;
var formatter = DateFormat.yMd();
var now = DateTime.now();
late List<BloodResult> data = [];

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getBloods();
    });
  }

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
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      // TODO
      print("2123");
    }
    return data;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: Colors.red[700],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'รายงานระดับน้ำตาลในเลือดแบบกราฟ'),
          legend: Legend(
            isVisible: true,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<BloodResult, String>>[
            LineSeries<BloodResult, String>(
              dataSource: data,
              xValueMapper: (BloodResult sales, _) =>
                  formatter.format(sales.bloodTime!).toString(),
              yValueMapper: (BloodResult sales, _) => sales.bloodLevel,
              name: 'ระดับน้ำตาลในเลือด',
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
