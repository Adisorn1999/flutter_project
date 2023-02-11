import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/model/blood_chart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  }

  Apiprovider apiprovider = Apiprovider();
  late List<BloodChartsModel?> _bloodChartModel;
  var jsonResponse = [];

  Future<List<BloodChartsModel?>?> getBloods() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      var response = await apiprovider.getbloods(user_id!);
      if (response.statusCode == 200) {
        print(response.body);
        // jsonResponse = jsonDecode(response.body);
        _bloodChartModel =
            jsonResponse.map((e) => BloodChartsModel.fromJson(e)).toList();
      }
    } on Exception catch (e) {
      // TODO
    }
    return _bloodChartModel;
  }

  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 24),
      ChartData(2, 25),
      ChartData(3, 28),
      ChartData(4, 35),
      ChartData(5, 23),
      ChartData(6, 28),
      ChartData(7, 27),
      ChartData(8, 25),
      ChartData(9, 26),
      ChartData(10, 43),
      ChartData(11, 35),
      ChartData(12, 18),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bar Charts"),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryYAxis: NumericAxis(minimum: 10, maximum: 50),
            series: <ChartSeries<ChartData, int>>[
              ColumnSeries<ChartData, int>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final int y;
}
