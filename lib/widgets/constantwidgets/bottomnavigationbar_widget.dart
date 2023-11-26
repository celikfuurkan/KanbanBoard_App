import 'package:flutter/material.dart';

class BottomnavigationbarWidget extends StatelessWidget {
  const BottomnavigationbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      height: 100,
      child: const Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Stack(
              children: [
                Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.black,
                ),
                // İkonun iç kısmı (beyaz)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.home,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: 150), // Araya boşluk eklemek için SizedBox kullandık
            Text(
              "Go to Word Ninja",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
