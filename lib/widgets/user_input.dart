import 'package:flutter/material.dart';

import '../models/todo_model.dart'; //tambahkan baris ini

class UserInput extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final Function insertFunction; // ini akan menerima function addItem
  UserInput({required this.insertFunction, Key? key})
      : super(key: key); //ubah baris ini

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color(0xaabbccdd),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'add new todo',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            //buat todo
            Todo myTodo = Todo(
              title: textController.text,
              createdAt: DateTime.now(),
              isChecked: false,
            );
            //lempar ke parameter function insertFunction
            insertFunction(myTodo);
            FocusManager.instance.primaryFocus?.unfocus(); //menutup keyboard
          },
          child: const Text("Add"),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange[800],
          ),
        ),
      ]),
    );
  }
}
