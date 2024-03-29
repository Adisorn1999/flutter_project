import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Low/adviceL1.dart';
import 'adviceH1.dart';
import 'adviceH2.dart';
import 'adviceH3.dart';
import 'adviceH4.dart';
import 'package:google_fonts/google_fonts.dart';

class AdviceHomeHeight extends StatelessWidget {
  const AdviceHomeHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ระดับน้ำตาลในเลือดสูง",
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x82ff1111))),
                      child: Text('การปฏิบัติเบื้องต้น',
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH1()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x82ff1111))),
                      child: Text('สาเหตุของการเกิด ระดับน้ำตาลในเลือดสูง',
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH2()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x82ff1111))),
                      child: Text('อาการที่บ่งบอกว่า ระดับน้ำตาลในเลือดสูง',
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH3()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x82ff1111))),
                      child: Text('ป้องกันภาวะ ระดับน้ำตาลในเลือดสูง',
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH4()));
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
