import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdviceL1 extends StatelessWidget {
  const AdviceL1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "การปฏิบัติตนเบื้องต้น",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              // ignore: avoid_unnecessary_containers
              Padding(
                padding: const EdgeInsets.all(8.0),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const Text(
                    "  ผู้ป่วยยังรู้สึกตัวช่วยเหลือตนเองได้ ให้กินคาร์โบไฮเดรตที่ดูดซึมเร็ว 15-20 กรัม หรือ 1 ส่วน รอ 15 นาที เจาะน้ำตาลปลายนิ้วใหม่ ถ้าน้ำตาลในเลือดยังต่ำอยู่ กินคาร์โบไฮเดรตอีก 15-20 กรัม จนกว่าน้ำตาลมากกว่า 70มก.ดล กรณีเป็นก่อนมื้ออาหาร ควรกินอาหารทันที หากเป็นระหว่างมื้ออาหาร ให้กินคาร์โบไฮเดรต ดูดซึมช้า 1 ส่วน",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // ignore: avoid_unnecessary_containers
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 190,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "ปริมาณคาร์โบไฮเดรตชนิดดูดซึมเร็ว 15 กรัม",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "*(อย่างใดอย่างหนึ่ง)",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "- ลุกอม 3 เม็ด",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- น้ำผลไม้ 120-180 ซีซี)",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- น้ำตาล 1 ช้อนโต๊ะ",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- น้ำผึ้ง เฮลบลูบอย 1 ช้อนโต๊ะ",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          )
                        ],
                      ),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 215,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "ปริมาณคาร์โบไฮเดรตชนิดดูดซึมช้า 15 กรัม",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "*(อย่างใดอย่างหนึ่ง)",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "- ขนมปัง 1 แผ่น",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- กล้วยหรือแอ๊ปเปิ้ล)",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- โยเกิร์ต 200 กรัม",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- นมจืด 1 กล่อง",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "- ข้าวต้ม หรือโจ๊ก 1/2 ถ้วย",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffffffff)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
