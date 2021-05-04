import 'package:flutter/material.dart';
import 'package:promise/screens/home-page.dart';
import 'package:promise/screens/view-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Material,
          ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ViewScreen.id: (context) => ViewScreen(),
      },
      home: HomeScreen(),
    );
  }
}
