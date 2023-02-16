import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/model/blood_chart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
  }

  Apiprovider apiprovider = Apiprovider();
  late List<BarChartModel?> barChartModel;
  var jsonResponse = [];
  bool loading = true;
  late List<BarChartModel> data = [];

  Future<List<BarChartModel?>?> getBloods() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      final int? year = prefs.getInt('year');
      var response = await apiprovider.getbloodsAVG(user_id!, year!);
      if (response.statusCode == 200) {
        print(response.body);
        // jsonResponse = jsonDecode(response.body);
        List<BarChartModel> tempdata = barChartModelFromJson(response.body);
        setState(() {
          data = tempdata;
          loading = false;
        });
      }
    } on Exception catch (e) {
      // TODO
    }
    return data;
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
        title: Text("Bar Chart With API"),
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Container(
                height: 300,
                child: charts.BarChart(
                  _createSampleData(),
                  animate: true,
                ),
              ),
      ),
    );
  }
}
