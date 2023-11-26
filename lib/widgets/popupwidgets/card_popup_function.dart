// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:kanbanboard/model/card_model.dart';

void showCardDialog(BuildContext context, CardModel card) {
  String title = card.title;
  //String reportedBy = card.;
  String description = card.description;
  String date = card.date;
  NetworkImage avatarImage = NetworkImage(card.imageUrl);

  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: avatarImage,
                      ),
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Reported by ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: "Project Manager",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        elevation: 0,
                        backgroundColor: const Color.fromRGBO(
                          116,
                          75,
                          252,
                          1,
                        ),
                        child: const Text(
                          "To Do",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(
                          165,
                          165,
                          165,
                          1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(
                          165,
                          165,
                          165,
                          1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color.fromRGBO(
                      242,
                      242,
                      242,
                      1,
                    ),
                  ),
                  child: Text(description),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: avatarImage,
                          ),
                          Positioned(
                            left: 35.0,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: avatarImage,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
