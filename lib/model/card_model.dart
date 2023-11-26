// BlogModel sınıfı, bir blogun genel yapısını temsil eder.
class BlogModel {
  String? blogTitle; // Blogun başlığını içeren bir String değişkeni
  int?
      blogCount; // Blogda bulunan kartların sayısını tutan bir tamsayı değişkeni
  List<CardModel>? cardModel; // Blogdaki kartları içeren bir CardModel listesi

  // BlogModel'in yapıcı metodudur.
  BlogModel({
    this.blogTitle, // İsteğe bağlı blog başlığı
    this.blogCount, // İsteğe bağlı kart sayısı
    this.cardModel, // İsteğe bağlı kart modeli
  });

  // JSON'dan BlogModel oluşturan bir fabrika metodu
  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        blogTitle: json["blogTitle"], // JSON'daki blog başlığı
        blogCount: json["blogCount"], // JSON'daki blog kart sayısı
        cardModel: List<CardModel>.from(
            // JSON'daki kart verilerini CardModel listesine dönüştürme
            json["cardModel"].map((x) => CardModel.fromJson(x))),
      );

  // BlogModel'i JSON'a dönüştüren metod
  Map<String, dynamic> toJson() => {
        "blogTitle": blogTitle, // Blog başlığını JSON'a ekler
        "blogCount": blogCount, // Kart sayısını JSON'a ekler
        "cardModel": cardModel != null // Kart modelini JSON'a ekler, varsa
            ? List<dynamic>.from(cardModel!.map((x) => x.toJson()))
            : null,
      };
}

// CardModel sınıfı, blogdaki her bir kartın yapısını temsil eder.
class CardModel {
  String title; // Kartın başlığını içeren String değişkeni
  String description; // Kartın açıklamasını içeren String değişkeni
  String imageUrl; // Kartın resim URL'sini içeren String değişkeni
  String date; // Kartın tarihini içeren String değişkeni

  // CardModel'in yapıcı metodudur.
  CardModel({
    required this.title, // Zorunlu card başlığı
    required this.description, // Zorunlu card açıklaması
    required this.imageUrl, // Zorunlu resim URL'si
    required this.date, // Zorunlu card tarihi
  });

  // JSON'dan CardModel oluşturan factory metodu
  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        title: json["title"], // JSON'daki card başlığı
        description: json["description"], // JSON'daki card açıklaması
        imageUrl: json["imageUrl"], // JSON'daki resim URL'si
        date: json["date"], // JSON'daki card tarihi
      );

  // CardModel'i JSON'a dönüştüren metod
  Map<String, dynamic> toJson() {
    return {
      'title': title, // card başlığını JSON'a ekler
      'description': description, // card açıklamasını JSON'a ekler
      'imageUrl': imageUrl, // Resim URL'sini JSON'a ekler
      'date': date, // card tarihini JSON'a ekler
    };
  }
}
