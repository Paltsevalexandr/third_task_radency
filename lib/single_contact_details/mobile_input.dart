import 'package:flutter/material.dart';

class MobileInput extends StatelessWidget {
  final mobile;
  final handleMobile;

  MobileInput(this.mobile, this.handleMobile);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        initialValue: mobile,
        onChanged: handleMobile,
        decoration: InputDecoration(
          labelText: 'Mobile',
          hintText: 'Enter the mobile number',
          helperText: 'format +38 xxx xxx xx xx',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          RegExp regExp = RegExp(r"^(\+38)\s?\d{3}\s?\d{3}\s?\d{2}\s?\d{2}$");
          if (regExp.hasMatch(value)) {
            return null;
            
          }
          return 'Please enter a number in right format +3 xxx xxx xx xx';
        },
      ),
    );
  } 
}

