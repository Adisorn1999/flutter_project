import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class Activity3 extends StatelessWidget {
  const Activity3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "การเดินทำให้อารมณ์ดีขึ้น",
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
                "  นอกจากทางกายภาพแล้ว การเดินยังช่วยให้ให้อารมณ์ สุขภาพจิตดีขึ้น แถมยังช่วยลดความเครียด ความหดหู่ใจและความวิตกกังวล นอกจากการเดินแล้ว การออกกำลังกายในรูปแบบอื่นๆ ก็ช่วยให้อารมณ์ดีขึ้นได้เช่นกัน เพราะการออกกำลังกายจะช่วยให้สมองมีความไว้ต่อสารเซโรโทนิน (Serotonin) และสารนอร์อิพิเนฟริน (Nor epinephrine) ซึ่งฮอร์โมนเหล่านี้ช่วยลดความรู้สึกซึมเศร้าและกระตุ้นการปล่อยสารเอ็นดอร์ฟิน (Endorphins) ซึ่งช่วยทำให้เรารู้สึกมีความสุขได้"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
