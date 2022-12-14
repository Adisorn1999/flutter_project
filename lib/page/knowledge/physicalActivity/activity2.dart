import 'package:flutter/material.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class Adctivity2 extends StatelessWidget {
  const Adctivity2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "การเดินช่วยเผาผลาญไขมันหน้าท้อง",
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
                "  ปัญหาไขมันส่วนเกินที่บริเวณหน้าท้อง และรอบๆ ตัวนั้นมีความเกี่ยวข้องกับการเพิ่มความเสี่ยงในการเกิดโรคต่างๆ เช่น โรคเบาหวานประเภทที่ 2 และโรคหัวใจ ในความเป็นจริงๆ แล้ว ผู้ชายที่มีรอบเอวมากกว่า 40 นิ้ว และผู้หญิงที่มีรอบเอวมากกว่า 35 นิ้ว มักจะมีไขมันในช่องท้องมากซึ่งเป็นความเสี่ยงต่อสุขภาพมากมาย"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  หนึ่งในวิธีที่ที่มีประสิทธิภาพที่สุดในการ ลดพุง ลดไขมันส่วนเกินหน้าท้องคือ การออกกำลังกายแบบแอโรบิค (Aerobic Exercise) อย่างสม่ำเสมอ เช่น การวิ่ง ว่ายน้ำ ปั่นจักรยาน การเต้น การกระโดดเชือก และ การเดิน โดยมีการศึกษาเล็ก ๆ ชิ้นหนึ่ง พบว่าผู้หญิงอ้วนที่มีการเดินออกกำลังกาย 50-70 นาที 3 วันต่อสัปดาห์เป็นเวลา 12 สัปดาห์ โดยเฉลี่ยแล้วรอบเอวลดลง 1.1 นิ้ว (ประมาณ 2.8 เซนติเมตร) และไขมันในร่างกายลดลงร้อยละ 1.5"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  นอกจากนี้ยังมีการศึกษาอื่นๆ พบว่า การที่ควบคุมปริมาณแคลอรี่ไปพร้อมๆ กับการเดินออกกำลังกาย เดินลดพุง เป็นเวลา 1 ชั่วโมงต่อวัน เป็นเวลานาน 12 ชั่วโมง ช่วยทำให้รอบเอวลดลง 3.7 นิ้ว และยังช่วยลดไขมันในร่างกายลงร้อยละ 1.3 เมื่อเทียบกับผู้ที่ควบคุมอาหารเพียงอย่างเดียว"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
