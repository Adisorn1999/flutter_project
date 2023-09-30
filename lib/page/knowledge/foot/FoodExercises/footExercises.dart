import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FootExercises extends StatelessWidget {
  const FootExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การบริหารเท้า",
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
                  "  การบริหารเท้าทุกวัน ช่วยให้การหมุนเวียนของเลือดที่เท้าดีขึ้น โดยบริหารดังนี้",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 5,
            ),
            // ignore: avoid_unnecessary_containers
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 210,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "- บริหารขาในท่าแกว่งเท้า ให้ยืนเกาะขอบโต๊ะ แกว่งไปมา ไม่งอขาขณะแกว่งในด้านหน้า ให้แกร็งยกขาสูงขึ้นจากนั้นนับ 1-10 แล้วจึงแกว่งไปด้านหลัง ทำทีละข้างๆ ละ 10 ครั้ง",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- บริหารน่อง นั่งเก้าอี้หลังตรง ยกปลายเท้าขึ้นสูงจากพื้น 1 ฟุต  แกร็งเท้าให้ชี้เข้าหาตัว ส้นเท้าเหยียดออกจนรู้สึกน่องตึง นับ 1-10 แล้วคลายกล้ามนื้อที่น่อง ทำ 10 ครั้งสลับข้าง",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
