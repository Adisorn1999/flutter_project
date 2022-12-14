import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhysicalActivity extends StatelessWidget {
  String txt1;
  double size;
  Color color;

  PhysicalActivity(this.txt1, this.size, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
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
                style: const TextStyle(fontSize: 16, color: Color(0xffffffff)),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
