import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_list_third_task/main.dart';

class Star extends StatelessWidget {
  final contact;

  Star(this.contact);

  Widget build(BuildContext context) {
    var data = context.read<ContactList>();
    return Container(
      width: 40, 
      height: 40,
      margin: EdgeInsets.only(right: 20),
      child: GestureDetector(
        child: contact['isFavourite']
        ? Container(
            child: Image.asset('assets/images/star.png'), 
            padding: EdgeInsets.all(12),
            width: 40, height: 40)   
        : null,
        onTap: data.addToFavourites(contact['name'])
      ),
    );
  }
} 
      