// Splash screen ekranı ana tasarımı

import 'package:flutter/material.dart';
import 'package:kanbanboard/ui/home_page.dart'; // Ana sayfa için import

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Belirtilen süre (3 saniye) sonra ana sayfaya geçiş yapılacak
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePageScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Dikey yönde ortalamak için
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Genişliği maksimuma getirmek için
        children: [
          _buildTopContainers(), // Üst kısımdaki containerın oluşturulduğu metot
          const SizedBox(height: 7),
          _buildMiddleContainers(), // Orta kısımdaki containerın oluşturulduğu metot
          Expanded(
            child: Center(
              child:
                  _buildCenterContent(), // Ortadaki içeriğin oluşturulduğu metot
            ),
          ),
          _buildBottomContainers(), // Alt kısımdaki containerın oluşturulduğu metot
          const SizedBox(height: 7),
          _buildBottomRowContainers(), // Alt satırdaki containerın oluşturulduğu metot
        ],
      ),
    );
  }

  // Üst kısımdaki container oluşturan metot
  Widget _buildTopContainers() {
    // Row içinde iki expanded container
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(116, 75, 252, 1),
            ),
            height: 80,
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          flex: 9,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              color: Color.fromRGBO(116, 75, 252, 1),
            ),
            height: 80,
          ),
        ),
      ],
    );
  }

  // Orta kısımdaki container oluşturan metot
  Widget _buildMiddleContainers() {
    // Row içinde iki expanded container
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(116, 75, 252, 1),
            ),
            height: 200,
          ),
        ),
        Expanded(flex: 9, child: Container()),
      ],
    );
  }

  // Ortadaki içeriği oluşturan metot
  Widget _buildCenterContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Dikeyde merkezlemek için
        children: [
          Center(
            child: SizedBox(
              width: 150,
              child: Image.asset(
                'assets/splash_assets/Google-Flutter-Icon-PNG.png',
                color: const Color.fromRGBO(116, 75, 252, 1),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Building the future',
            style: TextStyle(
              color: Color.fromRGBO(216, 216, 216, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  // Alt kısımdaki container oluşturan metot
  Widget _buildBottomContainers() {
    // Row içinde iki expanded container
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: Color.fromRGBO(116, 75, 252, 1),
            ),
            height: 200,
          ),
        ),
      ],
    );
  }

  // Alt satırdaki container oluşturan metot
  Widget _buildBottomRowContainers() {
    // Row içinde iki expanded container
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(116, 75, 252, 1),
            ),
            height: 80,
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
              ),
              color: Color.fromRGBO(116, 75, 252, 1),
            ),
            height: 80,
          ),
        ),
      ],
    );
  }
}
