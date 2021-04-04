import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_list_third_task/main.dart';
import 'package:contact_list_third_task/contact_list/divider_letters.dart';
import 'package:contact_list_third_task/contact_list/single_contact.dart';

class ContactListView extends StatelessWidget {

  List sortList(list) {
    List<Map> sortedList = List.from(list);
    sortedList.sort((contact1, contact2) {

      String secondName1 = contact1['name'].split(' ')[1];
      String secondName2 = contact2['name'].split(' ')[1];

      return secondName1.compareTo(secondName2);
    });
    return sortedList;
  }

  Map<String, List> makeContactsMap(List contacts) {
    Map<String, List> result = {};
    
    List sortedContacts = sortList(contacts);
    
    for(int i = 0; i < sortedContacts.length; i++) {
      String name = sortedContacts[i]['name'];
      String secondName = name.split(' ')[1];
      String checkLetter = secondName[0].toUpperCase();
     
      result[checkLetter] = [...?result[checkLetter], sortedContacts[i]];

    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: 
        Consumer<ContactList>(
          builder: (context, data, child) {
          Map<String, List> sortContacts  = makeContactsMap(data.list);

          List<Widget> listWithDividers = [];

          for(var key in sortContacts.keys){
            listWithDividers.add(DividerLetters(key));

            for(var contact in sortContacts[key]){
              listWithDividers.add(SingleContact(contact));
            }
          }
          return 
            ListView(
              children: listWithDividers
            );
          },
        )
    );
  }
}
