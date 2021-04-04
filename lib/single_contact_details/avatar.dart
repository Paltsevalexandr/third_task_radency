import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final image;

  Avatar(this.image);
  
  Widget build(BuildContext context) {

    return
      Container (
        width: 100,
        height: 100,
        child: Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: 
              AssetImage('assets/images/$image')
          ),
        )
          
      );
  }
}
