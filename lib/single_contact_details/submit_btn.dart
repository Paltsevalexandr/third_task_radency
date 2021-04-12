import 'package:flutter/material.dart';

class SubmitBtn extends StatelessWidget {
  final editContact;
  final _formKey;
  SubmitBtn(this.editContact, this._formKey);
  
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
