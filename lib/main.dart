// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanbanboard/ui/splash_screen.dart'; // Splash ekranı için import edilen dosya

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// Uygulamanın ana MaterialApp widget'ını içeren MyApp sınıfı
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // debugShowCheckedModeBanner bandını kapatır
      home: const SplashScreen(), // Başlangıç ekranını gösterir
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white, // Scaffold arka plan rengini beyaz yapar
      ),
    );
  }
}
