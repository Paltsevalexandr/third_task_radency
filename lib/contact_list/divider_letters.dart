import 'package:flutter/material.dart';

class DividerLetters extends StatelessWidget {
  final text;

  DividerLetters(this.text);

  Widget build(BuildContext context) {
    return 
      Container(
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          text, 
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.w600, 
            color: Colors.black45)
        )
      );
  }
}