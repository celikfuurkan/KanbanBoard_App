// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kanbanboard/model/card_model.dart';
import 'package:kanbanboard/network/services/add_block_service.dart';
//import 'package:kanbanboard/network/services/add_block_service.dart';

class PopupTodoWidget extends StatefulWidget {
  final List<BlogModel> backlogData; // Geri log verilerini tutacak alan

  const PopupTodoWidget(this.backlogData, {Key? key}) : super(key: key);

  @override
  State<PopupTodoWidget> createState() => _PopupTodoWidgetState();
}

class _PopupTodoWidgetState extends State<PopupTodoWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController assigneeController = TextEditingController();

  bool isButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          barrierColor: Colors.transparent,
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return dialogScreen(context);
          },
        );
        setState(() {
          isButtonVisible = false;
        });
      },
      backgroundColor: isButtonVisible
          ? const Color.fromRGBO(116, 75, 252, 1)
          : Colors.transparent,
      elevation: isButtonVisible ? 6.0 : 0.0,
      child: isButtonVisible
          ? const Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            )
          : const SizedBox(),
    );
  }

  Dialog dialogScreen(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        isButtonVisible = true;
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "To do",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              _buildTextField('Enter your text', 'Title', titleController),
              const SizedBox(height: 10),
              _buildTextField(
                  'Enter your text', 'Description', descriptionController,
                  maxLines: 2),
              const SizedBox(height: 10),
              _buildTextField('Enter your text', 'Status', statusController),
              const SizedBox(height: 10),
              _buildTextField(
                  'Enter your text', 'Assignee', assigneeController),
              const SizedBox(height: 10),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    _printTextFields();
                    Navigator.of(context).pop();
                    setState(() {
                      isButtonVisible = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(116, 75, 252, 1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hintText, String labelText, TextEditingController controller,
      {int? maxLines}) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(242, 242, 242, 1),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(242, 242, 242, 1),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(177, 177, 177, 1),
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _printTextFields() async {
    print('Title: ${titleController.text}');
    print('Description: ${descriptionController.text}');
    print('Status: ${statusController.text}');
    print('Assignee: ${assigneeController.text}');
    var addModel = CardModel(
        title: titleController.text,
        description: descriptionController.text,
        imageUrl:
            "https://miro.medium.com/v2/resize:fit:600/1*PiHoomzwh9Plr9_GA26JcA.png",
        date: DateTime.now().toString());

    await AddBlockService.cardEkle(1, addModel, widget.backlogData);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    assigneeController.dispose();
    super.dispose();
  }
}
