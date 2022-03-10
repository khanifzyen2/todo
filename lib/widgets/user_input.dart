import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(children: [
        const Expanded(child: TextField()),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Add"),
          // style: TextStyle,
        ),
      ]),
    );
  }
}
