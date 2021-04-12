import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final contact;
  final addToFavourites;

  Star(this.contact, this.addToFavourites);

  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(right: 20),
      child: GestureDetector(
          child: contact['isFavourite']
              ? Container(
                  child: Image.asset('assets/images/star.png'),
                  padding: EdgeInsets.all(12),
                  width: 40,
                  height: 40)
              : null,
          onTap: addToFavourites
        ),
    );
  }
}
