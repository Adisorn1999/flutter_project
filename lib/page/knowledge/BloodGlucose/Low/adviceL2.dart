import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AdviceL2 extends StatelessWidget {
  const AdviceL2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การปฏิบัติตนเบื้องต้น",
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Text(
                  "หากผู้ป่วยหมดสติ หรือรู้สึกตัวแต่ช่วยตัวเองไม่ได้ จัดเป็นน้ำตาลในเลือดต่ำรุนแรง",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 135,
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "- โทรหารถพยาบาล (โทร 1169)",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ถ้าหากหมดสติห้ามให้น้ำหวานหรือลูกอม เนื่องจากอาจสำลักได้",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ห้ามใส่มือหรือช้อนเข้าไปในปาก)",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
