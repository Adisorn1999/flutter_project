import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AdviceL4 extends StatelessWidget {
  const AdviceL4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("น้ำตาลต่ำขณะนอนหลับ",
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
                  "  เป็นภาวะที่เกิดขึ้นได้ ถ้ากินอาหารมื้อเย็นน้อย หรือออกกำลังกายหนัก อันตรายเนื่องจากผู้ป่วยอาจไม่รู้สึกตัวตื่นมากินน้ำหวานแก้ไขได้ทัน  สังเกตอาการ ดังนี้",
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
                height: 140,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "- ชุดนอนเปียกเหงื่อ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ปวดศรีษะเมื่อตื่นนอน",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ฝันร้าย",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ไม่รู้สึกพักผ่อน ยังเพลีย",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 210,
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "วิธีแก้ไข",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ตรวจเช็คระดับน้ำตาลปลายนิ้ว ช่วง 02.00-0.300 ถ้าน้อยกว่า 70 มก.ดล. ให้กินคาร์โบไฮเดรต1 ส่วน และปรึกษาแพทย์",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ข้อแนะนำ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- แนะนำให้ตรวจน้ำตาลช่วงเที่ยงคืนบ้างโดยเฉพาะถ้าวันไหนมีกิจกรรมมากเป็นพิเศษ",
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
