import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanbanboard/network/network_manager.dart';
import 'package:kanbanboard/network/services/blog_service.dart';
import 'package:kanbanboard/widgets/cardwidgets/build_card_widget.dart';
import 'package:kanbanboard/widgets/cardwidgets/card_title_widget.dart';
import 'package:kanbanboard/widgets/constantwidgets/appbar_widget.dart';
import 'package:kanbanboard/widgets/constantwidgets/bottomnavigationbar_widget.dart';
import 'package:kanbanboard/widgets/constantwidgets/banner_widget.dart';
import 'package:kanbanboard/widgets/popupwidgets/popup_todo_widget.dart';
import '../model/card_model.dart';

// NetworkManager sağlayıcısını oluşturuyor
final networkManagerProvider = Provider<NetworkManager>((ref) {
  return NetworkManager("https://api.npoint.io/8518ae46bf02ca8e885c");
});

// Ana sayfa widget'ı, ConsumerWidget sınıfından türetilir
class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Blog servis sağlayıcısından gelen veriyi izler
    final AsyncValue<List<BlogModel>> blogListAsync =
        ref.watch(blogServiceProvider);

    return Scaffold(
      floatingActionButton: blogListAsync.when(
        data: (blogList) {
          return PopupTodoWidget(blogList);
        },
        loading: () => FloatingActionButton(
          onPressed: () {}, // Placeholder onPressed function
          child: const Icon(Icons.add),
        ),
        error: (error, stackTrace) => FloatingActionButton(
          onPressed: () {}, // Placeholder onPressed function
          child: const Icon(Icons.error),
        ),
      ),
      appBar: const AppbarWidgets(), // Appbar widget'ı
      bottomNavigationBar:
          const BottomnavigationbarWidget(), // Bottomnavigationbar widget'ı
      body: blogListAsync.when(
        data: (blogList) {
          return Column(
            children: [
              const BannerWidget(), // Banner widget'ı
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Blog listesindeki her bir öğe için kart başlığı ve kart widget'ı oluşturur
                      for (var backlog in blogList)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardTitleWidget(
                                backlog: backlog), // Kart başlığı widget'ı
                            const SizedBox(height: 10),
                            BuildCardWidget(backlog: backlog), // Kart widget'ı
                            const SizedBox(height: 30),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(), // Yükleniyor durumu için
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'), // Hata durumu için hata mesajı gösterir
        ),
      ),
    );
  }
}
