import 'package:flutter/material.dart';
import '../widgets/user_input.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple todo app'),
      ),
      body: Column(
        children: [
          //kita akan membuat widget todo disini untuk Userinput, todocard (representasi visual satu todo, berupa checkbox, title dan createdat), dan todolist (list dari todocard)
          UserInput(),
        ],
      ),
    );
  }
}
