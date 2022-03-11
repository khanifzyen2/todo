import 'package:flutter/material.dart';
import '../models/db_model.dart';

class Todolist extends StatelessWidget {
  //membuat object dari databaseConnect
  DatabaseConnect db = DatabaseConnect();
  Todolist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {},
      ),
    );
  }
}
