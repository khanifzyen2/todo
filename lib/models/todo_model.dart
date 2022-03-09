class Todo {
  int? id;
  final String title;
  DateTime createdAt;
  bool isChecked;

  //membuat constructor
  Todo({
    this.id,
    required this.title,
    required this.createdAt,
    required this.isChecked,
  });

  //untuk menyimppan ke database, kita perlu ubah dalam bentuk map
  //buat sebuah fungsi untuk melakukan itu
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt
          .toString(), //sqflite database tidak mendukung date, sehingga kita simpan sebagai text
      'isChecked': isChecked
          ? 1
          : 0, //juga tidak support boolean, sehingga kita simpan sebagai integer
    };
  }

  //fungsi berikut untuk keperluan debugging
  @override
  String toString() {
    return 'Todo(id: $id, title: $title, createdAt: $createdAt, isChecked: $isChecked';
  }
}
