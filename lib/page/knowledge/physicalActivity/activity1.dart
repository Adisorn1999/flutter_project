import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class Activity1 extends StatelessWidget {
  const Activity1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การเดินช่วยเผาผลาญแคลอรี่",
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
            FootCareTxt1(
                "  พลังงานแคลอรี่ เป็นสิ่งที่ร่างกายต้องใช้สำหรับการดำเนินชีวิต ใช้ในการหายใจ การเคลื่อนไหวร่างกาย และการคิด ซึ่งพลังงานแคลอรี่ที่ร่างกายต้องการในแต่ละวันก็จะแตกต่างกันออกไปในแต่ละคนตามเพศ น้ำหนัก และการทำกิจกรรมในแต่ละวัน ดังนั้นคุณต้องเผาผลาญพลังงานแคลอรี่ให้มากกว่าที่รับประทานเข้าไป เพื่อลดน้ำหนัก ซึ่งกิจวัตรประจำวันที่ไม่ค่อยขยับร่างกาย นั่งอยู่กับที่นานๆ นั่นยิ่งทำให้ช่วยเพิ่มน้ำหนักไม่พอ ยังช่วยเพิ่มความเสี่ยงสุขภาพอื่นๆ อีกมากมาย แต่การเดิน 1.6 กิโลเมตรนั้นสามารถเผาผลาญแคลอรี่ได้ประมาณ 100 กิโลแคลอรี่ แต่ทั้งนี้ทั้งนั้นก็ขึ้นอยู่กับเพศและน้ำหนักด้วย"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  จากการศึกษาหนึ่งที่ทำการวัดจำนวนแคลอรี่ที่ถูกเผาผลาญ โดยผู้ที่เดินด้วยความเร็ว 5 กม. ต่อชั่วโมงหรือวิ่งด้วยความเร็ว 10 กิโลเมตรต่อชั่วโมง พบว่าผู้ที่เดินเร็วๆ จะเผาผลาญพลังงานเฉลี่ย 90 แคลอรี่ต่อ 1.6 กิโลเมตร แต่หากต้องการเพิ่มการเผาผลาญพลังงานแคลอรี่ด้วยการเดิน การเดินขึ้นเขาหรือทางที่มีเนินจะช่วยเผาผลาญพลังงานแคลอรี่ได้เพิ่มมากขึ้น"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
