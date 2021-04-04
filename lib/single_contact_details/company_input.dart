import 'package:flutter/material.dart';

class CompanyInput extends StatelessWidget {
  final company;
  final handleCompany;

  CompanyInput(this.company, this.handleCompany);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        initialValue: company,
        onChanged: handleCompany,
        decoration: InputDecoration(
          labelText: 'Company',
          hintText: 'Enter the company',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          return null;
        },
      ),
    );
  }
}
