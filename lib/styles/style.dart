import 'package:flutter/material.dart';

final ButtonStyle kButtonPrimary = ElevatedButton.styleFrom(
    shadowColor: Color(0xFF31CD9D).withOpacity(0.2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
    primary: Color(0xFF31CD9D),
    padding: EdgeInsets.symmetric(vertical: 16),
    textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

final ButtonStyle kButtonSecondary = ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
    side: BorderSide(width: 1, color: Color(0xFF31CD9D)),
    primary: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 16),
    textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

final TextStyle kTextPrimary = TextStyle(
    fontFamily: 'Nunito',
    color: Color(0xFF31CD9D),
    fontSize: 16,
    fontWeight: FontWeight.w300);

final TextStyle kTextWhite = TextStyle(
    fontFamily: 'Nunito',
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w300);
