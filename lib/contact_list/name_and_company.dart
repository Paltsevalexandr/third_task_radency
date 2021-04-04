import 'package:flutter/material.dart';

class NameAndCompany extends StatelessWidget {
  final name;
  final company;

  NameAndCompany(this.name, this.company);
  
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              name, 
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black))
          ),
          Text(
            company, 
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black38))
        ],
      ),
      margin: EdgeInsets.only(right: 20));
  }
} 
        