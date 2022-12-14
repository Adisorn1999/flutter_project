import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/physicalActivity/physicalActivity.dart';

class Activity6 extends StatelessWidget {
  const Activity6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "การเดินช่วยลดน้ำหนักได้",
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
            PhysicalActivity(
                "  ทุกๆการเดิน 20 ก้าวจะเบิร์นได้ 1 กิโลแคลอรี่ แต่ก็ขึ้นอยู่กับน้ำหนักตัวด้วยน้ำหนักมากก็จะเบิร์นได้มากกว่า",
                70,
                Colors.blue),
            const SizedBox(
              height: 10,
            ),
            PhysicalActivity(
                "  ทุกๆ 3,500 กิโลแคลอรี่ ที่เบิร์นออกไป น้ำหนักจะลดลง 0.45 กิโลกรัม",
                70,
                Colors.blue),
            const SizedBox(
              height: 10,
            ),
            PhysicalActivity(
                "เดิน 10,000 ก้าวจะเบิร์นออกไปได้ถึง 400-500  กิโลแคลอรี่ ซึ่งจะช่วยให้น้ำหนักลดลงไปสัปดาห์ละกว่าครึ่งกิโลกรัมเล็กน้อย",
                95,
                Colors.blue),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
