import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import '../effect/effect_insulin/effect_mixtard.dart';

class InsulinMixtard extends StatelessWidget {
  const InsulinMixtard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "อินซูลินโดยวิธีฉีด (Mixtard 70/30)",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                height: 240,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  child: Image.asset(
                    'assets/insulin-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FootCareTxt1Blue(" วิธีฉีด "),
              FootCareTxt1(
                  "ปกติจะฉีดใต้ผิวหนัง (SC)แต่ต้องอยู่ภายใต้คำแนะนำ จากแพทย์อย่างเคร่งครัด"),

              const SizedBox(
                height: 10,
              ),
              FootCareTxt1Blue(" การเตรียมยาในกรณีที่ใช้อินซูลิน "),

              FootCareTxt1(
                  " - อินซูลินแบ่งออกเป็นหลายชนิด ตามระยะเวลาที่ออกฤทธิ์ ตรวจดูลักษณะยา ถ้าเป็นชนิดน้ำใส ต้องไม่หนืด ไม่มีสี ถ้าเป็นชนิดน้ำขุ่นแขวนตะกอน ให้คลึงขวดยาบนฝ่ามือทั้งสองข้างเบา ๆ เพื่อให้ยาผสมกันทั่วทั้งขวด ห้ามเขย่าขวดอย่างเด็ดขาด เพราะจะทำให้เกิดฟองและทำให้ได้ปริมาณยาไม่ครบตามจำนวน ถ้าผู้ป่วยใช้อินซูลินใช้แอลกอฮอล์เช็ดทา ความสะอาดบริเวณฉีด ที่สำคัญห้ามฉีดซ้ำ ที่เดิมมากกว่า 1 ครั้ง ใน 1 - 2 เดือน เนื่องจาก อาจทำให้บริเวณที่ฉีดเกิดเป็นก้อนไตแข็ง เมื่อดึงเข็มออกให้ใช้กดเบา ๆ ห้ามนวดตรงที่ฉีด เพราะทำให้ยาดูดซึมเร็วเกินไปจนอาจเกิดน้ำตาลในเลือดต่ำได้ และในการฉีดครั้งต่อไปควรฉีดห่างจากจุดเดิม 1 นิ้ว"),

              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EffectMixtard()));
                },
                child: const Text(
                  'ผลข้างเคียงจากการใช้ยา อ่านต่อ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
