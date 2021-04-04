import 'package:flutter/material.dart';

class SubmitBtn extends StatelessWidget {
  final editContact;
  final removeContact;
  final _formKey;
  SubmitBtn(this.editContact, this.removeContact, this._formKey);
  
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        width: 60,
        height: 30,
        margin: EdgeInsets.only(right: 5),
        child: TextButton(
          onPressed: () => {
            if(_formKey.currentState.validate()) {
              removeContact(),
              editContact(),
              Navigator.pop(context)
            }
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white)
          )
        ),
      );
  }
}
