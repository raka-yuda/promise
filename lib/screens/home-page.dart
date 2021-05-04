import 'package:flutter/material.dart';
import 'package:promise/components/button.dart';
import 'package:promise/models/todo.dart';
import 'package:promise/provider/todo_provider.dart';
import 'package:promise/screens/view-page.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoProvider todoDb = TodoProvider();

  void addNewItem() async {
    final todo = Todo(
      title: 'Title 1',
    );
    await todoDb.addItem(todo);
  }

  Future<List<Todo>> getAllItems() async {
    List<Todo> items = await todoDb.fetchMemos();
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64,
              width: 400,
              child: ButtonSecondary(
                text: 'Add New Item',
                onPressed: () async {
                  addNewItem();
                },
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              height: 64,
              width: 400,
              child: ButtonSecondary(
                text: 'Get Items',
                onPressed: () async {
                  List<Todo> items = await getAllItems();
                  items.forEach((element) {
                    print(element.title);
                  });
                },
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              height: 64,
              width: 400,
              child: ButtonSecondary(
                text: 'Go to Page View',
                onPressed: () {
                  Navigator.pushNamed(context, ViewScreen.id);
                },
              ),
            ),
            FutureBuilder(
                future: getAllItems(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> list = [];
                    List<Todo> items = snapshot.data;
                    items.forEach((item) {
                      print(item.title);
                      list.add(Text(item.title));
                    });
                    return Column(
                      children: list,
                    );
                  } else {
                    return Text('Empty Data');
                  }
                })
          ],
        )),
      ),
    );
  }
}
