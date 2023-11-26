import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanbanboard/ui/home_page.dart';
import '../../model/card_model.dart';

// blogServiceProvider adında bir FutureProvider tanımlaması yapılıyor.
// Bu provider, blog verilerini getirmek için ağ isteği yapar ve sonucu sağlar.
final blogServiceProvider = FutureProvider<List<BlogModel>>((ref) async {
  final networkManager = ref.read(
      networkManagerProvider); // networkManagerProvider'dan bir referans alınıyor.
  final response = await networkManager
      .get(); // networkManager üzerinden GET isteği yapılıyor.

  if (response.statusCode == 200) {
    // Eğer yanıtın durum kodu 200 ise:
    final List<dynamic> jsonData =
        jsonDecode(response.body); // Yanıtın body'si JSON olarak decode edilir.
    List<BlogModel> blogList = jsonData
        .map((json) => BlogModel.fromJson(json))
        .toList(); // JSON verisi BlogModel nesnelerine dönüştürülür.
    return blogList; // Dönüştürülmüş blog verileri döndürülür.
  } else {
    // Eğer yanıtın durum kodu 200 değilse:
    throw Exception(
        "Error. Status Code: ${response.statusCode}"); // Hata fırlatılıyor ve hata durumu gösterilir.
  }
});
