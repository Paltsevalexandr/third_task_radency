import 'package:flutter/material.dart';
import 'package:contact_list_third_task/single_contact_details/submit_btn.dart';
import 'package:contact_list_third_task/single_contact_details/avatar.dart';
import 'package:contact_list_third_task/single_contact_details/name_input.dart';
import 'package:contact_list_third_task/single_contact_details/mobile_input.dart';
import 'package:contact_list_third_task/single_contact_details/company_input.dart';
import 'package:contact_list_third_task/single_contact_details/bio_textarea.dart';

class SingleContactPage extends StatelessWidget {
  
  final contact;
  final editContact;

  SingleContactPage(this.contact, this.editContact);

  final _formKey = UniqueKey();

  handleData(String dataType) {
    return (String text) {
      contact[dataType] = text;
    };
  }

  Widget build(BuildContext context) {
    var contactForm = Form(
        key: _formKey,
        child: ListView(
          children: [
            Avatar(contact['image']),
            NameInput(contact['name'], handleData('name')),
            MobileInput(contact['mobile'], handleData('mobile')),
            CompanyInput(contact['company'], handleData('company')),
            BioTextarea(contact['bio'], handleData('bio')),
          ],
        ));
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            SubmitBtn(editContact(contact), _formKey)
          ],
        ),
        body: contactForm);
  }
}
