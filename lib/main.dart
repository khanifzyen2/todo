import 'package:flutter/material.dart';
import './models/db_model.dart';
import './models/todo_model.dart';
import './screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseConnect db = DatabaseConnect();
  //insert sample todo
  db.insertTodo(Todo(
    title: 'ini adalah contoh todo',
    createdAt: DateTime.now(),
    isChecked: false,
  ));
  print(await db.getTodo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
