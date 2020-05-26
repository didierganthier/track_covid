import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.color, @required this.cardTitle, @required this.cardValue, @required this.gradientColor});

  final Color color, gradientColor;
  final String cardTitle, cardValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 145,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [gradientColor, color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(cardTitle, style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),),
          Text(cardValue, style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
