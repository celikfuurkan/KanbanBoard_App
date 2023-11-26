// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:kanbanboard/model/card_model.dart';
import 'package:kanbanboard/widgets/popupwidgets/card_popup_function.dart';

class BuildCardWidget extends StatefulWidget {
  final BlogModel backlog;

  const BuildCardWidget({Key? key, required this.backlog}) : super(key: key);

  @override
  _BuildCardWidgetState createState() => _BuildCardWidgetState();
}

class _BuildCardWidgetState extends State<BuildCardWidget> {
  late List<CardModel> _backlogList;

  @override
  void initState() {
    super.initState();
    _backlogList = widget.backlog.cardModel!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ReorderableListView(
          scrollDirection: Axis.horizontal,
          onReorder: _onReorder,
          children: _buildCardList(),
        ),
      ),
    );
  }

  List<Widget> _buildCardList() {
    return _backlogList
        .map((card) => Padding(
              key: ValueKey(card), // Each card must have a unique key
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: GestureDetector(
                  onTap: () {
                    showCardDialog(context, card);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              (card.description.length > 150)
                                  ? '${card.description.substring(0, 150)}...'
                                  : card.description,
                              style: const TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                          card.imageUrl,
                                        ),
                                      ),
                                      Positioned(
                                        left: 30.0,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                            card.imageUrl,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  card.date,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(159, 159, 159, 1),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final CardModel item = _backlogList.removeAt(oldIndex);
      _backlogList.insert(newIndex, item);
    });
  }
}
