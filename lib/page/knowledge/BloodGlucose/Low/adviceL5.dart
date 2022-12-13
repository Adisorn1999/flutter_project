import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdviceL5 extends StatelessWidget {
  const AdviceL5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ป้องกันภาวะน้ำตาลในเลือดต่ำได้อย่างไร",
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
            Container(
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Text(
                  " เมื่อมีอาการน้ำตาลต่ำเกิดขึ้น ควรบันทึกปริมาณยากิน ยาอินซูลิน ปริมาณอาหารที่กินก่อนมีอาการ กิจกรรม การออกกำลังกาย หรือการเจ็บป่วยทั้งหมด หากทราบว่าเกิดจากสาเหตุใดไม่สมดุลก็ปรับที่สาเหตุนั้น หากอาหารและกิจกรรมปกติ ไม่มีการเจ็บป่วยบ่งว่าขนาดยาไม่เหมาะสม แนะนำปรึกษาแพทย์เพื่อปรับลดยาต่อไป",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Text(
                  " ภาวะน้ำตาลต่ำนี้แม้พบได้บ่อย แต่ไม่ควรชะล่าใจ เนื่องจากพบว่าทุกครั้งที่มีอาการน้ำตาลต่ำมีผลเสียต่อหัวใจ และหากเกิดอาการซ้ำบ่อยๆ อาการเตือนทางระบบประสาทอัตโนมัติจะลดลง เด่นที่อาการระบบประสาท เช่น หมดสติได้บ่อยขึ้น ดังนั้นหากมีอาการจึงควรปรึกษาแพทย์",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 195,
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "ข้อควรระวัง",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ไม่ควรปรับยาด้วยตนเองโดยไม่ปรึกษาแพทย์ก่อน ผู้ป่วยส่วนหนึ่งหยุดฉีดอินซูลินทันทีในมื้อที่มีอาการน้ำตาลต่ำ ทำให้มื้อต่อมาน้ำตาลขึ้นสูงมาก",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- แต่ผู้ป่วยอีกกลุ่มหนึ่งก็ฉีดยาเท่าเดิมตลอดแม้มีอาการน้ำตาลต่าและมีไข้ไม่สบายกินอาหารไม่ได้ ทำให้น้ำตาลต่ำจนหมดสติได้ ที่ควรทำคือควรปรึกษาแพทย์)",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
