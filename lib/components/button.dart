import 'package:flutter/material.dart';
import 'package:promise/styles/style.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonPrimary({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        style: kButtonPrimary,
        onPressed: onPressed,
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFF31CD9D).withOpacity(0.2),
                blurRadius: 30,
                offset: Offset(0, 16),
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kTextWhite,
          ),
        ));
  }
}

class ButtonSecondary extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonSecondary({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        style: kButtonSecondary,
        onPressed: onPressed,
        child: Container(
          width: size.width,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kTextPrimary,
          ),
        ));
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonText({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: kTextPrimary,
      ),
    );
  }
}
