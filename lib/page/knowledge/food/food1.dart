import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodCareTxt1.dart';

class Food1 extends StatelessWidget {
  const Food1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "คาร์โบไฮเดรต ",
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
                "   คาร์โบไฮเดรต เป็นสารอาหารหลักที่มีผลต่อระดับน้ำตาลในเลือดมากที่สุด"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "   1.1 ข้าว แป้ง ควรรับประทาน ข้าวกล้องหรือข้าวไม่ขัดสี ขนมปังโฮลวีท ถั่วเมล็ดแห้ง ข้าวโอ๊ต ลูกเดือย เนื่องจากมีใยอาหารสูง ช่วยในการชะลอระดับน้ำตาลในเลือดได้"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "   1.2ผัก สามารถรับประทานได้ไม่จำกัดเนื่องจากให้พลังงานต่ำใยอาหารสูง ควรเน้นผักใบเขียวเช่น คะน้า ตำลึง ผักกาดขาว ผักบุ้งแต่อาจมีบางผักบางประเภทที่ควรจำกัดปริมาณการรับประทาน เช่นมันเทศ เผือก ฟักทอง แครอท เพราะมีปริมาณแป้งที่สูงมาก"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "   1.3ผลไม้ สามารถทานได้ในปริมาณที่แตกต่างกัน ขึ้นกับดัชนีน้ำตาล (Glycemic Index)เช่น แอปเปิ้ล1ผลเล็ก,ส้ม1ผลเล็ก,ฝรั่ง1ผลเล็ก,กล้วยหอม1/2ผล,มะละกอ6-8ชิ้นคำ,แก้วมังกร1/2ผลเป็นต้น ซึ่งในแต่ละวันอาจทานได้2-3ครั้ง/วันทั้งนี้ผู้ที่เป็นเบาหวาน ควรหลีกเลี่ยงน้ำผักผลไม้ เพราะจะทำให้ระดับน้ำตาลในเลือดสูงขึ้นอย่างรวดเร็ว"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
