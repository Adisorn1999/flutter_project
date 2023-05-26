import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                // ignore: prefer_const_constructors
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                // ignore: prefer_const_constructors
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
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
//         barChartModel =
//             jsonResponse.map((e) => BarChartModel.fromJson(e)).toList();
//       }
//     } on Exception catch (e) {
//       // TODO
//     }
//     return barChartModel;
//   }

//   Widget build(BuildContext context) {
//     List<charts.Series<BarChartModel, String>> _createSampleData() {
//       return [
//         charts.Series<BarChartModel, String>(
//           data: data,
//           id: 'sales',
//           colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
//           domainFn: (BarChartModel barChartModel, _) => barChartModel.month,
//           measureFn: (BarChartModel barChartModel, _) =>
//               barChartModel.averageBlood,
//         )
//       ];
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bar Charts"),
//       ),
//       body: Center(
//         child: Container(
//           child: SfCartesianChart(
//             primaryYAxis: NumericAxis(minimum: 10, maximum: 50),
//             series: <ChartSeries<BarChartModel, int>>[
//               ColumnSeries<BarChartModel, int>(
//                   dataSource: barChartModel,
//                   xValueMapper: (BarChartModel barChartModel, _) =>
//                       barChartModel.month,
//                   yValueMapper: (BarChartModel barChartModel, _) =>
//                       barChartModel.averageBlood),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
