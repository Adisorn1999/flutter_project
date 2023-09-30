import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodCareTxt1.dart';
import 'package:google_fonts/google_fonts.dart';

import 'footCare2.dart';

class FootCare1 extends StatelessWidget {
  const FootCare1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("วิธีการดูแลเท้า",
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
                "  1.ล้างเท้าด้วยน้ำธรรมดาและสบู่ที่มีฤทธิ์อ่อนทุกวันตอนเช้าและก่อนนอน ไม่ควรใช้แปรงหรือขนแข็งขัดเท้า ไม่จำเป็นต้องแช่เท้า ถ้าต้องการทำอาจใช้น้ำอุ่นน้อยๆ สามารถทดสอบได้โดยใช้มือ ข้อศอก หรือเทอร์โมมิเตอร์วัดเพื่อมิให้น้ำร้อนจนเกินไปจนทำให้ผิวหนังพองและเป็นแผล แต่ไม่ควรแช่นานเกิน 5 นาที หลังจากนั้นซับทุกส่วนโดยเฉพาะบริเวณซอกนิ้วเท้าให้แห้งด้วยผ้าขนหนู"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  2.สำรวจเท้าด้วยตนเองทุกวันในสถานที่มีแสงสว่างเพียงพอว่ามีแผล รอยช้ำ ผิวเปลี่ยนสี หรือเม็ดพองหรือไม่ โดยตรวจทั่วทั้งฝ่าเท้า ส้นเท้า ซอกระหว่างนิ้วเท้า และรอบเล็บเท้า เมื่อพบความผิดปกติควรพบแพทย์"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  3.ควรใช้กระจกส่องในการตรวจฝ่าเท้าถ้าไม่สามารถก้มเท้าดูด้วยตนเอง หรืออาจขอให้ญาติช่วยสำรวจเท้า"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  4.ทาครีมหรือโลชั่นถ้าผิวแห้ง เพื่อป้องกันการเกิดรอยแตก ทาบางๆ โดยเว้นบริเวณซอกนิ้วเท้าและรอบเล็บเท้า ถ้าผิวหนังมีเหงื่อมากควรใช้แป้งฝุ่นหรือผงโรยเท้า"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  5.สวมรองเท้าตลอดเวลา ทั้งในและนอกบ้าน ไม่ควรเดินเท้าเปล่า"),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FootCare2()));
              },
              child: const Text(
                'อ่านต่อ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
