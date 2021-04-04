import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_list_third_task/main.dart';
import 'package:contact_list_third_task/single_contact_details/single_contact_page.dart';

class Avatar extends StatelessWidget {
  final contact;
    
  Avatar(this.contact);

  Widget build(BuildContext context) {
    var data = context.read<ContactList>();
    return
      Container(
        width: 40, height: 40,
        margin: EdgeInsets.only(right: 20),
        child: GestureDetector(
          child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/${contact['image']}')
              ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SingleContactPage(
                  contact: contact, 
                  editContact: data.editContact,
                  removeContact: data.removeContact);
              })
            );
          }
        )
      );
  }
}

