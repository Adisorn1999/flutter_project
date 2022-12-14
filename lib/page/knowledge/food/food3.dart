import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class Food3 extends StatelessWidget {
  const Food3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "โซเดียม",
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
                "  โซเดียมสำหรับผู้ป่วยเบาหวานทีมีภาวะความดันโลหิตสูงร่วมด้วย ควรจำกัดปริมาณโซเดียมในแต่ละวันไม่เกิน2,000มิลลิกรัม/วัน"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1("น้ำปลา 1 ช้อนโต๊ะ มีโซเดียม 1,160-1,420 มิลลิกรัม"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1("ซีอิ้ว 1 ช้อนโต๊ะ มีโซเดียม 960-1,420 มิลลิกรัม"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1("ผงชูรส 1 ช้อนชา มีโซเดียม 497 มิลลิกรัม"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1("เกลือ 1 ช้อนชา มีโซเดียม 2,000 มิลลิกรัม"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "  อาจใช้เครื่องสมุนไพร ในการชูรสอาหารให้มีกลิ่นหอมชวนรับประทานมากขึ้นเช่น ขิง,ข่า,ตะไคร้,ใบมะกรูด(เครื่องต้มยำต่างๆ)"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
