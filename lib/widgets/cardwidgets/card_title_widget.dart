import 'package:flutter/material.dart';
import 'package:kanbanboard/model/card_model.dart';

class CardTitleWidget extends StatelessWidget {
  final BlogModel backlog;
  const CardTitleWidget({Key? key, required this.backlog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 45),
      child: Row(
        children: [
          Text(
            backlog.blogTitle!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            backlog.cardModel!.length.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
