class Todo {
  final int id;
  final String title;
  final int done;

  Todo({this.id, this.title, this.done = 0});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "title": title,
      "done": done,
    };
  }
}
