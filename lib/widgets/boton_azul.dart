import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function onPressed;
  final color;
  final double width;

  const BotonAzul(
      {required this.text,
      required this.onPressed,
      this.color,
      required this.width})
      : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      highlightElevation: 5,
      color: color,
      shape: StadiumBorder(),
      onPressed: this.onPressed,
      child: Container(
        width: width,
        height: 55,
        child: Center(
          child: Text(this.text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
