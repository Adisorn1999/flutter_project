import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class FoodAdvice extends StatelessWidget {
  const FoodAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "คำแนะนำเพิ่มเติม",
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
                "  คำแนะนำเพิ่มเติมในการควบคุมน้ำตาลในเลือด  อาจแบ่งอาหารเป็นมื้อที่เล็กลง เพิ่มจำนวนมื้อมากขึ้นแบ่งกระจายระดับน้ำตาลในแต่ละมื้อไม่ให้สูงเกินไปหากเกิดภาวะน้ำตาลต่ำ (วิงเวียนศรีษะ หน้ามืด)ให้ทำการเช็คระดับน้ำตาลปลายนิ้ว หากผลที่ได้ต่ำให้ทำการแก้ไขโดยดื่มน้ำผลไม้ 100-150 ml แล้วตรวจช้ำ ถ้าไม่ดีขึ้นให้รีบมาพบแพทย์อีกครั้ง"),
          ],
        ),
      ),
    );
  }
}
