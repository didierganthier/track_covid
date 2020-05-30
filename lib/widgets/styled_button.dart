import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {

  StyledButton({this.imageName, this.buttonText, this.textColor, this.buttonColor, this.iconColor, this.onTap});

  final String imageName;
  final String buttonText;
  final Color buttonColor, textColor, iconColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 145.0,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(image: AssetImage('images/$imageName'),height: 30.0, color: iconColor),
            Text(buttonText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: textColor))
          ],
        ),
      ),
    );
  }
}
