import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xaabbccdd),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
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
          onPressed: () {},
          child: const Text("Add"),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange[800],
          ),
        ),
      ]),
    );
  }
}
