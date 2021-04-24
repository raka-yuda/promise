import 'package:flutter/material.dart';
import 'package:promise/components/button.dart';
import 'package:promise/screens/view-page.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home-screen';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
            child: Container(
          height: 120,
          width: 400,
          child: ButtonSecondary(
            text: 'Go to Page View',
            onPressed: () {
              Navigator.pushNamed(context, ViewScreen.id);
            },
          ),
        )),
      ),
    );
  }
}
