import 'package:flutter/material.dart';
import 'package:contact_list_third_task/single_contact_details/single_contact_page.dart';

class Avatar extends StatelessWidget {
  final contact;
  final editContact;

  Avatar(this.contact, this.editContact);

  Widget build(BuildContext context) {

    return Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 20),
        child: GestureDetector(
            child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/${contact['image']}')),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SingleContactPage(contact,editContact);
              }));
            }));
  }
}
