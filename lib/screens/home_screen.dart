import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackcovid/widgets/CirlceImageWithText.dart';
import 'package:trackcovid/widgets/styled_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.indigo,
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.short_text, color: Colors.white),
                        Icon(Icons.notifications_none, color: Colors.white)
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Covid-19', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white)),
                        Container(
                          height: 40.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image(image: AssetImage('images/Haiti.png'), height: 30.0,),
                              Text('HTI', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Are you feeling sick', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                        SizedBox(height: 10.0,),
                        Text('Any of covid-19 symptoms? please call or sms us immediatly for help.', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            StyledButton(
                              imageName: 'phone.png',
                              textColor: Colors.white,
                              buttonColor: Colors.redAccent,
                              buttonText: 'Call Now',
                            ),
                            StyledButton(
                              imageName: 'sms.png',
                              textColor: Colors.white,
                              buttonColor: Colors.blue,
                              buttonText: 'SMS Now',
                              iconColor: Colors.white,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text('Prevention', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 30.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleImageWithText(text: 'Avoid close contact', imagePath: 'images/images.jpg'),
              CircleImageWithText(text: 'Wash your hands often', imagePath: 'images/cleanhands.jpg'),
              CircleImageWithText(text: 'Wear a facemask', imagePath: 'images/facemask.jpg'),
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.indigoAccent,Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('images/heart.png'),
                    SizedBox(
                        child: Column(
                          children: <Widget>[
                            Text('Do your own test', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10.0,),
                            Text('Follow the instructions to do your own test', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                          ],
                        ),
                        width: 150.0
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }
}