import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';

class MedicationPioglitazone extends StatelessWidget {
  const MedicationPioglitazone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ยา Pioglitazone",
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
                "   โปรตีน ควรบริโภคเนื้อปลาและหรือเนื้อไก่เป็นหลักโดยการทานปลามากกว่า2ครั้ง/สัปดาห์ จะทำให้ได้รับ โอเมก้า3ซึ่งมีอยู่ในปลาแซลมอน,ทูน่า,ปลาทู,ปลาช่อน เป็นต้นและควรหลีกเลี่ยงเนื้อสัตว์แปรรูปต่างๆเช่นไส้กรอก,เบคอน,แฮม,หมูยอ,หมูแผ่น และ หมูหยอง"),
          ],
        ),
      ),
    );
  }
}
