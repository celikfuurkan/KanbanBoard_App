import 'package:flutter/material.dart';

class AppbarWidgets extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 100,
      backgroundColor: const Color.fromRGBO(116, 75, 252, 1),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          child: Image.asset(
            'assets/splash_assets/Google-Flutter-Icon-PNG.png',
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
