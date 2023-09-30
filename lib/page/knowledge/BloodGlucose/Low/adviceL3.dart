import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adviceL1.dart';
import 'adviceL2.dart';
import 'package:google_fonts/google_fonts.dart';

class AdviceL3 extends StatelessWidget {
  const AdviceL3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("อาการที่บ่งบอกว่าน้ำตาลในเลือดต่ำ",
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
                    "  อาการที่พบได้ เช่น ตัวสั่น มือสั่น เวียนศีรษะ ปวดศีรษะ กระสับกระส่าย เหงื่อแตก หิว ตามัว หน้าซีด อารมณ์เปลี่ยนแปลง เช่น หงุดหงิด เศร้า โมโห โดยไม่มีเหตุผล เซื่องซึม สับสน สมาธิสั้น ชาบริเวรรอบปาก เป็นลม หมดสติ ชัก เป็นต้น",
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "  หากมีเครื่องเจาะน้ำตาลปลายนิ้วพบว่า น้ำตาลน้อยกว่า 70 มก.ดล. หรือขึ้น Lo แสดงว่าน้ำตาลในเลือดต่ำ หากไม่สามารถเจาะน้ำตาลได้ทันทีแต่มีอาการชัดเจน ควรรักษาแก้ไขเบื้องต้นก่อนเช่นกัน",
                      style: TextStyle(fontSize: 16),
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
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color(0xcc5286d4))),
                                        child: Text(
                                            'ผู้ป่วยยังรู้สึกตัวช่วยเหลือตนเองได้',
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AdviceL1()));
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
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xcc5286d4))),
                                          child: Text(
                                              'ผู้ป่วยหมดสติ หรือรู้สึกตัว',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AdviceL2()));
                                          })),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
