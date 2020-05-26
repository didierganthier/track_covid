import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trackcovid/constants.dart';
import 'package:trackcovid/widgets/reusable_card.dart';
import 'package:trackcovid/widgets/reusable_card_small.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {

  int affected = 0, death = 0, recovered = 0, active = 0, serious = 0;


  void getCoronaData() async {
    Response response = await get(url);

    if(response.statusCode == 200)
    {
      String data = response.body;
      var coronaData = jsonDecode(data);

      setState(() {
        affected = coronaData['cases'];
        death = coronaData['deaths'];
        recovered = coronaData['recovered'];
        active = coronaData['active'];
        serious = coronaData['critical'];
      });
    }
    else
    {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();

    getCoronaData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.indigo
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.short_text, color: Colors.white),
                        Icon(Icons.notifications_none, color: Colors.white)
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Text('Statistics', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Total', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ReusableCard(color: Colors.orange, cardTitle: 'Affected', cardValue: affected.toString(),gradientColor: Colors.orangeAccent,),
                        ReusableCard(color: Colors.redAccent, cardTitle: 'Death', cardValue: death.toString(), gradientColor: Colors.pinkAccent,)
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ReusableCardSmall(color: Colors.green, cardTitle: 'Recovered', cardValue: recovered.toString(), gradientColor: Colors.greenAccent,),
                        ReusableCardSmall(color: Colors.blue, cardTitle: 'Active', cardValue: active.toString(), gradientColor: Colors.lightBlueAccent,),
                        ReusableCardSmall(color: Colors.deepPurpleAccent, cardTitle: 'Serious', cardValue: serious.toString(), gradientColor: Colors.purpleAccent,),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 238,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}


