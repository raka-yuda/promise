import 'dart:io';

import 'package:promise/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ApiTodoProvider {
  Future<Database> initDatabase() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "todo.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Todos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          done INT(1))""");
    });
  }

  Future<List<Todo>> getTodos() async {
    //returns the memos as a list (array)

    final db = await initDatabase();
    final maps = await db
        .query("Todos"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        done: maps[i]['done'],
      );
    });
  }

  Future<int> addItem(Todo item) async {
    //returns number of items inserted as an integer

    final db = await initDatabase(); //open database

    return db.insert(
      "Todos",
      item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> deleteTodo(int id) async {
    //returns number of items deleted
    final db = await initDatabase();

    int result = await db.delete("Todos", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateTodo(int id, Todo item) async {
    // returns the number of rows updated

    final db = await initDatabase();

    int result = await db
        .update("Todos", item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
