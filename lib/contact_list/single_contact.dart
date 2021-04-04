import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_list_third_task/main.dart';
import 'package:contact_list_third_task/contact_list/star.dart';
import 'package:contact_list_third_task/contact_list/avatar.dart';
import 'package:contact_list_third_task/contact_list/name_and_company.dart';

class SingleContact extends StatelessWidget {
  final contact;
  
  SingleContact(this.contact);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Star(contact),
          Consumer<ContactList>(
            builder: (context, data, child) {
              return Avatar(contact);
            }
          ),
          NameAndCompany(contact['name'], contact['company'])
        ],
      ),   
    );
  }
}
