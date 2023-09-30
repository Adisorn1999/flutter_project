// ignore_for_file: avoid_unnecessary_containers, avoid_print, duplicate_ignore

import 'dart:convert';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/model/TKUserModel.dart';
import 'package:flutter_application/page/blood/add_blood.dart';
import 'package:flutter_application/page/medication/add_medication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/drawer_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'food/addFood.dart';
import 'knowledge/knowledgDiabetes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  TkUserModel? _tkUserModel;

  Apiprovider apiprovider = Apiprovider();

  Future<TkUserModel?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      var response = await apiprovider.authen(token);
      print(token);
      if (response.statusCode == 200) {
        // var jsonRs = jsonDecode(response.body);
        print(response.body);

        _tkUserModel = TkUserModel.fromJson(jsonDecode(response.body));
        print(_tkUserModel?.decoded.userId);
        final int? userId = _tkUserModel?.decoded.userId;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('userId', userId!);
        return _tkUserModel;
      }
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DSME'),
        ),
        drawer: const DrawerMane(),
        body: FutureBuilder(
          future: getToken(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 90,
                        width: double.infinity,
                        // ignore: prefer_const_constructors
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Text(
                              "สวัสดีคุณ ${snapshot.data.decoded.username ?? ''}",
                              style: GoogleFonts.roboto(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: Image.asset(
                                  'assets/ellipse-1-bg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                      height: 65,
                                      width: 280,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xcc5286d4))),
                                          child: Text('บันทึกค่าน้ำตาลในเลือด',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddBlood()));
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: Image.asset(
                                  'assets/ellipse-2-bg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                      height: 65,
                                      width: 280,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xcc5286d4))),
                                          child: Text('ความรู้เกี่ยวกับเบาหวาน',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const KnowledgDiabetes()));
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: Image.asset(
                                  'assets/ellipse-3-bg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                      height: 65,
                                      width: 280,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xcc5286d4))),
                                          child: Text('คลังยา',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddMedication()));
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            // ignore: duplicate_ignore
                            children: [
                              SizedBox(
                                height: 65,
                                width: 65,
                                child: Image.asset(
                                  'assets/ellipse-4-bg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                      height: 65,
                                      width: 280,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xcc5286d4))),
                                          child: Text('อาหารและการให้พลังงาน',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddFood()));
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 277,
                        height: 160,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                          child: Image.asset(
                            'assets/rectangle-3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const LinearProgressIndicator();
          },
        ));
  }
}
