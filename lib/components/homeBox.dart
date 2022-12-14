import 'package:flutter/material.dart';

// ignore: camel_case_types
class Homebox extends StatelessWidget {
  String title;
  String img;
  Navigator navigator;
  Homebox(this.title, this.img, this.navigator, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 65,
                    width: 280,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: Text(title),
                        onPressed: () {
                          navigator;
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
