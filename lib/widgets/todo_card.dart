import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'package:intl/intl.dart'; //tambahkan baris ini

// ignore: must_be_immutable
class Todocard extends StatefulWidget {
  //buat variable dimana todocard akan menerima data
  final int id;
  final String title;
  bool isChecked;
  final DateTime createdAt;
  final Function insertFunction;
  final Function deleteFunction;

  Todocard(
      {required this.id,
      required this.title,
      required this.isChecked,
      required this.createdAt,
      required this.insertFunction,
      required this.deleteFunction,
      Key? key})
      : super(key: key);

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    //buat local Todo
    Todo anotherTodo = Todo(
      id: widget.id,
      title: widget.title,
      createdAt: widget.createdAt,
      isChecked: widget.isChecked,
    );
    return Card(
      child: Row(
        children: [
          //ini untuk menampung checkbox
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = value!;
                });
                //ubah value dari isChecked dari anotherTodo
                anotherTodo.isChecked = value!;
                //simpan ke database
                widget.insertFunction(anotherTodo);
              },
            ),
          ),
          //ini untuk menampung title dan date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title, //ubah baris ini
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  DateFormat("dd MMM yyyy - hh:mm aaa")
                      .format(widget.createdAt), //ubah baris ini
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF8F8F8F),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              //menambah method delete
              widget.deleteFunction(anotherTodo);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
