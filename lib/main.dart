import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_list_third_task/contact_list/contact_list_view.dart';

List<Map> contactList = [
    {'name': 'Joshua Alison', 'company': 'Hoolie Inc.', 'isFavourite': true, 'image': 'face1.jpg', 'mobile': '+380933272800'},
    {'name': 'John Agnew', 'company': 'Stanford University', 'isFavourite': true, 'image': 'face2.jpg'},
    {'name': 'Sam Barnard', 'company': 'US Berkeley', 'isFavourite': true, 'image': 'face3.jpg'},
    {'name': 'Joel Cahnon', 'company': 'US Berkeley', 'isFavourite': false, 'image': 'face8.jpg'},
    {'name': 'Kyle Dickenson', 'company': 'Pied Piper', 'isFavourite': true, 'image': 'face7.jpg'},
    {'name': 'Lauren Davis', 'company': 'US Berkeley', 'isFavourite': true, 'image': 'face4.jpg'},
    {'name': 'Olga Petrova', 'company': 'Husky Energy', 'isFavourite': false, 'image': 'face5.jpg'},
    {'name': 'Megan Blakely', 'company': 'Husky Energy', 'isFavourite': false, 'image': 'face6.jpg'}
  ];

void main() {
  runApp(MaterialApp(
        title: 'Contact list',
        home: Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => ContactList(contactList),
            child: ContactListView()    
          )
        )
    )
  );
}
class ContactList with ChangeNotifier {
  
  List<Map> list;

  ContactList(this.list);

  Function addToFavourites(String name) {
    return () {
      list = [
        for(Map item in list) 
          if(item['name'] == name) 
            {...item, 'isFavourite': !item['isFavourite']} 
          else 
            item
      ];
      notifyListeners();
    };
  }

  Function editContact(contact) {
    return () {   
      list.add(contact);
      notifyListeners();
    };
  }

  Function removeContact(contact) {
    return () {
      list.remove(contact);
      notifyListeners();  
    }; 
  }
}
