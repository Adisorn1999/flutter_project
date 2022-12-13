import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdviceHeightBoxTxt3 extends StatelessWidget {
  String title;
  String txt1;
  String txt2;
  String txt3;
  Color color;
  double size;
  AdviceHeightBoxTxt3(
      this.title, this.txt1, this.txt2, this.txt3, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size,
                width: double.infinity,
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        txt1,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        txt2,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        txt3,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xffffffff)),
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
