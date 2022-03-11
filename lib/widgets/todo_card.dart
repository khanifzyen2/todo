import 'package:flutter/material.dart';

class Todocard extends StatefulWidget {
  //buat variable dimana todocard akan menerima data
  // final int id;
  // final String title;
  // bool isChecked;
  // final DateTime createdAt;
  // final Function insertFunction;
  // final Function deleteFunction;

  Todocard({Key? key}) : super(key: key);

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
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
              },
            ),
          ),
          //ini untuk menampung title dan date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title Text',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF8F8F8F),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
