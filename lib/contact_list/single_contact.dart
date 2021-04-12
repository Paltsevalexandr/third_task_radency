import 'package:flutter/material.dart';
import 'package:contact_list_third_task/contact_list/star.dart';
import 'package:contact_list_third_task/contact_list/avatar.dart';
import 'package:contact_list_third_task/contact_list/name_and_company.dart';

class SingleContact extends StatelessWidget {
  final contact;
  final editContact;
  final addToFavourites;

  SingleContact(this.contact, this.editContact, this.addToFavourites);

  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Star(contact, addToFavourites(contact['name'])),
          Avatar(contact, editContact),
          NameAndCompany(contact['name'], contact['company'])
        ],
      ),
    );
  }
}
