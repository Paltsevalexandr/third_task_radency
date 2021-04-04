import 'package:flutter/material.dart';
import 'package:contact_list_third_task/single_contact_details/submit_btn.dart';
import 'package:contact_list_third_task/single_contact_details/avatar.dart';
import 'package:contact_list_third_task/single_contact_details/name_input.dart';
import 'package:contact_list_third_task/single_contact_details/mobile_input.dart';
import 'package:contact_list_third_task/single_contact_details/company_input.dart';
import 'package:contact_list_third_task/single_contact_details/bio_textarea.dart';

class SingleContactPage extends StatefulWidget {
  SingleContactPage({
    Key key,
    this.contact,
    this.editContact,
    this.removeContact
  }) : super(key: key);

  final contact;
  final editContact;
  final removeContact;

  @override
  _SingleContactPageState createState() => _SingleContactPageState(
                contact, editContact, removeContact);
}

class _SingleContactPageState extends State<SingleContactPage> {
  final contact;
  final editContact;
  final removeContact;
  
  _SingleContactPageState(this.contact, this.editContact, this.removeContact);

  final _formKey = GlobalKey<FormState>();

  handleData(String dataType) {
    return (String text) {
      setState(() {
      contact[dataType] = text;
      });
    };
  }

  Widget build(BuildContext context) {
    var prevContact = contact;
    var contactForm = Form(
      key: _formKey,
      child: ListView(
        children: [
          Avatar(contact['image']),
          NameInput(contact['name'], handleData('name')),
          MobileInput(contact['mobile'], handleData('mobile')),
          CompanyInput(contact['company'],handleData('company')),
          BioTextarea(contact['bio'], handleData('bio')),
        ],
      )
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          SubmitBtn(editContact(contact), removeContact(prevContact), _formKey)
        ],
      ),
      body: contactForm
    );
  }
}
