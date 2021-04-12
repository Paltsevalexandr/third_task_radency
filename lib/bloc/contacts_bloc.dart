import 'dart:async';

class ContactsBloc {
  List contacts;

  ContactsBloc(this.contacts);

  final _contactsController = StreamController<Map<String, List>>();
  Stream<Map<String, List>> get contactsStream => _contactsController.stream;
  Sink<Map<String, List>> get contactsSink => _contactsController.sink;

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

    for (int i = 0; i < sortedContacts.length; i++) {
      String name = sortedContacts[i]['name'];
      String secondName = name.split(' ')[1];
      String checkLetter = secondName[0].toUpperCase();

      result[checkLetter] = [...?result[checkLetter], sortedContacts[i]];
    }
    return result;
  }

  Map getContactsMap() {
    var result = makeContactsMap(contacts);
    return result;
  }

  editContact(editedContact) {
    return () {
      for (Map contact in contacts) {
        if (contact['id'] == editedContact['id']) {
          contact = editedContact;
          break;
        }
      }
      contactsSink.add(makeContactsMap(contacts));
    };
  }

  Function addToFavourites(String name) {
    var func = () {
      print('fuck');
      contacts = [
        for (Map item in contacts)
          if (item['name'] == name)
            {...item, 'isFavourite': !item['isFavourite']}
          else
            item
      ];
      contactsSink.add(makeContactsMap(contacts));
    };
    return func;
  }

  void dispose() {
    _contactsController.close();
  }
}
