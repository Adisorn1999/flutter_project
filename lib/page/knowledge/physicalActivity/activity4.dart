import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class Activity4 extends StatelessWidget {
  const Activity4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "เพิ่มการเดินในชีวิตประจำวันได้อย่างไร",
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
                "  มีหลากหลายวิธีในการเพิ่มการเดินเข้าไปในชีวิตประจำวันของเราและทำให้เราทำได้ตามเป้าหมายที่เราตั้งไว้ เช่น"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(" - การใช้ Fitness Tracker นับก้าวของเรา"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "เดินเร็วในช่วงพักเที่ยงหรือหลังเมื้ออาหารเย็นให้เป็นนิสัย"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1("ชวนเพื่อนมาเดินตอนเย็นด้วย"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "พาสุนัขไปเดินทุกวัน หรือไปเดินเล่นพร้อมกับเพื่อนที่พาสุนัขไปเดินด้วย"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1("เปลี่ยนจากการพบปะเพื่อนที่โต๊ะ มาเป็นการเดินแทน"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "ทำธุระต่างๆ ด้วยการเดิน เช่น ไปร้านค้าด้วยการเดินแทนการนั่งรถ"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1("เดินไปทำงานถ้าที่ทำงานอยู่ใกล้บ้าน"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "พยายามเลือกเส้นทางใหม่ๆ และท้าทายเพื่อให้การเดินของเราน่าสนใจมากขึ้น"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "ลองเปลี่ยนการขึ้นลิฟท์เพียง หนึ่งหรือสองชั้นเป็นการใช้บันได ลองทำให้เป็นนิสัย เป็นต้น"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
