import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({required Key key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/lineaSola.png')),
            SizedBox(height: 20),
            Text(
              this.titulo,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
