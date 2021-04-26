import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  static const String id = 'view-screen';

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: size.width,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                  Container(
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: size.width,
              child: Center(
                child: Text(_pageController.page.toString()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
