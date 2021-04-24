import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  static const String id = 'view-screen';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: Text(
            'This is a home screen',
          ),
        ),
      ),
    );
  }
}
