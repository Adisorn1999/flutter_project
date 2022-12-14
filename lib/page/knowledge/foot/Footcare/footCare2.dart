import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import 'footCare3.dart';

class FootCare2 extends StatelessWidget {
  const FootCare2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "วิธีการดูแลเท้า",
          style: TextStyle(fontSize: 18),
        ),
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
                "  6.สวมรองเท้าขนาดพอดี ไม่คับหรือหลวมเกินไป วัสดุที่ทำควรมีลักษณะนิ่ม ไม่ใส่รองเท้าส้นสูง ก่อนใส่รองเท้าควรตรวจดูว่ามีสิ่งแปลกปลอมอยู่ในรองเท้าหรือไม่ เช่น หิน กรวด ทราย เพราะเท้าที่ชาจะไม่รู้ว่ามีสิ่งแปลกปลอมอยู่ เมื่อซื้อรองเท้าคู่ใม่ควรใส่เพียงวันละ 30 นาที - 1 ชั่วโมง ก่อนประมาณ 3-5 วัน และการเลือกซื้อรองเท้าควรทำในช่วงตอนบ่าย ซึ่งเป็นเวลาที่เท้าขยายขนาดกว่าตอนเช้า"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  7.ควรใส่ถุงเท้าด้วยทุกครั้ง โดยใช้ถุงเท้าที่ทำด้วยผ้าฝ้ายนุ่ม ไม่ควรใช้ไนล่อนหรือถุงเท้าที่รัดมาก และถุงเท้าที่ใส่ไม่ควรให้มีรอยย่นในรองเท้า หลีกเลี่ยงถุงเท้าที่ยาวสูงถึงน่องหรือมียางยืดที่รัดแน่นอยู่ขอบบน เพราะจะทำให้การไหลเวียนของเลือดที่มาเลี้ยงเท้าไม่สะดวก และต้องเปลี่ยนถุงเท้าทุกวัน"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  8.หลังอาบน้ำอาจใช้หินขัดเท้าถูเบาๆ ที่แคลลัส (ผวหนังที่หนาขึ้นจนแข็ง) เพื่อลดการหนาตัว ห้ามใช้สารเคมีที่ซื้อตามร้านทั่วไปเพื่อลอกตาปลาหรือจี้หูด เนื่องจากสารพวกนี้จะระคายเคืองผิวหนังมากไป ห้ามตัดตาปลาหรือหูดเองด้วยมีดโกน"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  9.การตัดเล็บ ให้ตัดหลังอาบน้ำใหม่ๆ เพราะเล็บเท้าจะนิ่มขึ้น ทำให้ตัดง่าย ถ้าสายตามองเห็นไม่ชัดควรให้ผู้อื่นช่วยตัดเล็บให้ เล็บเท้าที่หนาและผิดปกติควรได้รับการตะไบและตัดแต่งให้เรียบร้อย"),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FootCare3()));
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
