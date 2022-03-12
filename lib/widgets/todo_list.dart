import 'package:flutter/material.dart';
import 'package:todo/widgets/todo_card.dart';
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
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List<dynamic>? data = snapshot
              .data; //ini adalah data yang akan ditampilkan (list dari todo)
          int datalength = data!.length;

          return datalength == 0
              ? const Center(
                  child: Text("no data found"),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => Todocard(
                    id: data[i].id,
                    title: data[i].title,
                    isChecked: data[i].isChecked,
                    createdAt: data[i].createdAt,
                    insertFunction: () {},
                    deleteFunction: () {},
                  ),
                );
        },
      ),
    );
  }
}
