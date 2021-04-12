import 'package:flutter/material.dart';
import 'package:contact_list_third_task/contact_list/divider_letters.dart';
import 'package:contact_list_third_task/contact_list/single_contact.dart';
import 'package:contact_list_third_task/bloc/contacts_bloc.dart';

List<Map> contactList = [
  {
    'name': 'Joshua Alison',
    'company': 'Hoolie Inc.',
    'isFavourite': true,
    'image': 'face1.jpg',
    'mobile': '+380933272800',
    'id': 1
  },
  {
    'name': 'John Agnew',
    'company': 'Stanford University',
    'isFavourite': true,
    'image': 'face2.jpg',
    'id': 2
  },
  {
    'name': 'Sam Barnard',
    'company': 'US Berkeley',
    'isFavourite': true,
    'image': 'face3.jpg',
    'id': 3
  },
  {
    'name': 'Joel Cahnon',
    'company': 'US Berkeley',
    'isFavourite': false,
    'image': 'face8.jpg',
    'id': 4
  },
  {
    'name': 'Kyle Dickenson',
    'company': 'Pied Piper',
    'isFavourite': true,
    'image': 'face7.jpg',
    'id': 5
  },
  {
    'name': 'Lauren Davis',
    'company': 'US Berkeley',
    'isFavourite': true,
    'image': 'face4.jpg',
    'id': 6
  },
  {
    'name': 'Olga Petrova',
    'company': 'Husky Energy',
    'isFavourite': false,
    'image': 'face5.jpg',
    'id': 7
  },
  {
    'name': 'Megan Blakely',
    'company': 'Husky Energy',
    'isFavourite': false,
    'image': 'face6.jpg',
    'id': 8
  }
];

class ContactListView extends StatelessWidget {
  final _contactsBloc = ContactsBloc(contactList);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30),
        child: StreamBuilder<Map<String, List>>(
            stream: _contactsBloc.contactsStream,
            initialData: _contactsBloc.getContactsMap(),
            builder: (context, snapshot) {
              Map<String, List> sortContacts = snapshot.data;
              List<Widget> listWithDividers = [];

              var editContact = _contactsBloc.editContact;
              var addToFavourites = _contactsBloc.addToFavourites;

              for (var key in sortContacts.keys) {
                listWithDividers.add(DividerLetters(key));

                for (var contact in sortContacts[key]) {
                  listWithDividers.add(
                      SingleContact(contact, editContact, addToFavourites));
                }
              }
              return ListView(children: listWithDividers);
            }));
  }
}
