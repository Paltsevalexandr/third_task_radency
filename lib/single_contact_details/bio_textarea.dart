import 'package:flutter/material.dart';

class BioTextarea extends StatelessWidget {
  final bio;
  final handleBio;

  BioTextarea(this.bio, this.handleBio);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        maxLines: 10,
        initialValue: bio,
        onChanged: handleBio,
        decoration: InputDecoration(
          labelText: 'Bio',
          hintText: 'Enter some notes',
          helperText: 'max length 110 symbols',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if(value.length > 110) {
            return 'Max length 110 symbols';
          }
          return null;
        },
      ),
    );
  }
}
