import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kanbanboard/model/card_model.dart';

class AddBlockService {
  static Future<String> cardEkle(
    int index, // Eklenecek BlogModel'in index'i
    CardModel cardModel, // Eklenecek CardModel verisi
    List<BlogModel> blogModels, // BlogModel listesi
  ) async {
    if (index >= 0 && index < blogModels.length) {
      // Belirtilen indeksteki BlogModel'in cardModel listesine veri ekleme işlemi
      blogModels[index].cardModel?.add(cardModel);

      // Güncellenmiş blogModels listesini JSON formatına dönüştürme
      List<Map<String, dynamic>> updatedBlogModelsJson =
          blogModels.map((blog) => blog.toJson()).toList();

      // API endpoint URL'si
      const url = "https://api.npoint.io/8518ae46bf02ca8e885cs";

      // HTTP isteği için header'lar
      final headers = {'Content-Type': 'application/json'};

      try {
        // JSON formatına dönüştürülmüş veriyi POST isteği ile gönderme
        final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(updatedBlogModelsJson),
        );

        if (response.statusCode == 200) {
          String mesaj = jsonDecode(response.body);
          return mesaj;
        } else {
          throw Exception("Failed to add data: ${response.statusCode}");
        }
      } catch (e) {
        throw Exception("Failed to add data: ${e.toString()}");
      }
    } else {
      throw Exception("Invalid index: $index");
    }
  }
}
