import 'package:flutter/material.dart';
import 'package:contact_list_third_task/single_contact_details/avatar.dart';
import 'package:contact_list_third_task/single_contact_details/name_input.dart';
import 'package:contact_list_third_task/single_contact_details/mobile_input.dart';
import 'package:contact_list_third_task/single_contact_details/company_input.dart';
import 'package:contact_list_third_task/single_contact_details/bio_textarea.dart';

class ContactForm extends StatelessWidget {
  final contact;
  final editContact;
  final handleData;
  
  ContactForm(this.contact, this.editContact, this.handleData);

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Avatar(contact['image']),
          NameInput(contact['name'], handleData),
          MobileInput(contact['mobile'], handleData),
          CompanyInput(contact['company'],handleData),
          BioTextarea(contact['bio'], handleData),
        ],
      )
    );
  }
}
