import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodCareTxt1.dart';
import 'package:flutter_application/page/knowledge/food/food2.dart';

import '../foot/Footcare/footCare2.dart';
import 'food1.dart';
import 'food3.dart';
import 'foodAdvice.dart';

class FoodHome extends StatelessWidget {
  const FoodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "การรับประทานอาหาผู้ป่วยโรคเบาหวาน",
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
                "  การปรับเปลี่ยนพฤติกรรมชีวิต ประกอบด้วยการรับประทานอาหารให้ถูกหลักโภชนาการการมีกิจกรรมและออกกำลังกายอย่างสม่ำเสมอร่วมกับการนอนหลับให้เพียงพอ ไม่สูบบุหรี่ไม่ดื่มสุรา"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "   อาหารเบาหวานเป็นอาหารปกติสำหรับคนทั่วไปแต่อาจต้องเลือกชนิดของอาหารให้มีคุณภาพและควบคุมปริมาณในการรับประทานที่เหมาะสมเพื่อช่วยควบคุมระดับน้ำตาลในเลือดไม่ให้สูงหรือต่ำ จนเกินไปซึ่งแต่ละสารอาหารควรมีข้อจำกัดดังนี้"),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Food1()));
              },
              child: const Text(
                '1.คาร์โบไฮเดรต',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Food2()));
              },
              child: const Text(
                '2.โปรตีน ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Food3()));
              },
              child: const Text(
                '3.โซเดียม',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FoodAdvice()));
              },
              child: const Text(
                'คำแนะนำเพิ่มเติมในการควบคุมน้ำตาลในเลือด',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
