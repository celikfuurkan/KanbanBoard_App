import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "Refactoring for Word Ninja",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "New project for refactoring our app Word ninja",
        style: TextStyle(fontSize: 13),
      ),
      leading: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromRGBO(223, 213, 255, 1),
        ),
        width: 60,
        height: 60,
        child: Image.asset(
          'assets/home_page_assets/logo1.png',
        ),
      ),
    );
  }
}
