import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/page/knowledge/food/foodHome.dart';
import 'package:flutter_application/page/knowledge/physicalActivity/physicalActivityhome.dart';
import 'package:flutter_application/page/knowledge/smoking/smokingHome.dart';

import 'BloodGlucose/bloodGlucoseHome.dart';
import 'foot/footHome.dart';
import 'medication_insulin/medication_insulinHome.dart';
import 'package:google_fonts/google_fonts.dart';

class KnowledgDiabetes extends StatefulWidget {
  const KnowledgDiabetes({super.key});

  @override
  State<KnowledgDiabetes> createState() => _KnowledgDiabetesState();
}

class _KnowledgDiabetesState extends State<KnowledgDiabetes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ความรู้เกียวกับเบาหวาน",
              style: GoogleFonts.roboto(
                  fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        body: Center(
            child: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 70,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 180,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: Text('ระดับน้ำตาลในเลือด',
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const BloodGlucoseHome()));
                                })),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              height: 65,
                              width: 180,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xcc5286d4))),
                                  child: Text('การดูแลเท้า',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FootHome()));
                                  })),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 180,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: Text('การเคลื่อนไหวร่างกาย',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PhysicalActivityHome()));
                                })),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              height: 65,
                              width: 180,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xcc5286d4))),
                                  child: Text('การรับประทานอาหาร',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FoodHome()));
                                  })),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 65,
                            width: 180,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xcc5286d4))),
                                child: Text(
                                    'การใช้อินสุลินและยาลดน้ำตาลในเลือด',
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const MedicationAndInsulinhome()));
                                })),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              height: 65,
                              width: 180,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xcc5286d4))),
                                  child: Text('การสูบบุหรี่',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SmokingHome()));
                                  })),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
