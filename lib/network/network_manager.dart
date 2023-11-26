import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkManager {
  final String baseUrl;

  NetworkManager(this.baseUrl);

  // GET isteği yapmak için kullanılan fonksiyon
  Future<http.Response> get() async {
    final response = await http.get(Uri.parse(baseUrl));

    // Yanıtın durum kodu 200 ise yanıtı döndürür
    if (response.statusCode == 200) {
      return response;
    } else {
      // Durum kodu 200 değilse 'Failed to load data' hatası fırlatılır
      throw Exception('Failed to load data');
    }
  }

  // POST isteği yapmak için kullanılan fonksiyon
  Future<http.Response> post(
      Map<String, dynamic> data, Map<String, String>? headers) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: jsonEncode(data),
    );

    // Yanıtın durum kodu 200 ise yanıtı döndürür
    if (response.statusCode == 200) {
      return response;
    } else {
      // Durum kodu 200 değilse 'Failed to post data' hatası fırlatılır
      throw Exception('Failed to post data');
    }
  }
}
