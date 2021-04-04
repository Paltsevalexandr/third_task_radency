import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final name;
  final handleName;

  NameInput(this.name, this.handleName);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        initialValue: name,
        onChanged: handleName,
        decoration: InputDecoration(
          labelText: 'Name *',
          helperText: 'max length 70 symbols',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          RegExp regExp = RegExp(r"^[\wА-Яа-я]+\s[\wА-Яа-я]+$");

          if (regExp.hasMatch(value) && value.length <= 70) {
            return null;

          }
          return 'Print first and second name.\nOnly letters, digits, symbol "_"\nand max 70 symbols';
        },
      ),
    );
  } 
}

