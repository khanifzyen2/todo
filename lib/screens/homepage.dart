import 'package:flutter/material.dart';
import 'package:todo/models/db_model.dart'; //tambahkan baris ini
import '../models/todo_model.dart'; //tambahkan baris ini
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //kita perlu membuat function disini dimana agar dua widget bisa berkomunikasi
  //buat database object agar kita bisa mengakses database function
  DatabaseConnect db = DatabaseConnect();

  //function untuk menambah todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  //function untuk menghapus todo
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple todo app'),
      ),
      body: Column(
        children: [
          //kita akan membuat widget todo disini untuk Userinput, todocard (representasi visual satu todo, berupa checkbox, title dan createdat), dan todolist (list dari todocard)
          Todolist(
            insertFunction: addItem, //ta,bahkan baris ini
            deleteFunction: deleteItem, //tambahkan baris ini
          ),
          UserInput(
            insertFunction: addItem, //tambahkan baris ini
          ),
        ],
      ),
    );
  }
}
