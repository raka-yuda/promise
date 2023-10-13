// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:promise/main.dart';
import 'package:promise/models/todo.dart';
import 'package:promise/provider/todo_provider.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TodoProvider todoDb = TodoProvider();

  final todo = Todo(
    id: 1,
    title: 'Title 1',
    done: true,
  );

  await todoDb.addItem(todo);
  var memos = await todoDb.fetchMemos();
  print(memos[0].title); //Title 1

  final newTodo = Todo(
    id: todo.id,
    title: 'Title 1 changed',
    done: todo.done,
  );

  await todoDb.updateMemo(todo.id, newTodo);
  var updatedmemos = await todoDb.fetchMemos();
  print(updatedmemos[0].title); //Title 1 changed

  await todoDb.deleteTodo(todo.id);
  print(await todoDb.fetchMemos()); //[]
}
