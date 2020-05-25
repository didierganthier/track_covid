import 'package:flutter/material.dart';

class CircleImageWithText extends StatelessWidget {

  CircleImageWithText({@required this.text, @required this.imagePath});

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          maxRadius: 50.0,
        ),
        SizedBox(height: 10.0,),
        SizedBox(
          width: 100.0,
            child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))
        )
      ],
    );
  }
}
