import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:trackcovid/services/calls_and_messages_service.dart';
import 'package:trackcovid/services/service_locator.dart';
import 'package:trackcovid/widgets/cirle_image_text.dart';
import 'package:trackcovid/widgets/styled_button.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = '44328401';

  _initiateCall() {
    if (number?.isNotEmpty == true) {
      setState(() {
        FlutterPhoneState.startPhoneCall(number);
      });
    }
  }

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
                        Text('Êtes-vous malade?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                        SizedBox(height: 10.0,),
                        Text('Vous ressentez des symptômes? Demandez de l\'aide.', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            StyledButton(
                              imageName: 'phone.png',
                              textColor: Colors.white,
                              buttonColor: Colors.green,
                              buttonText: 'Appel',
                              onTap: () => _initiateCall(),
                            ),
                            StyledButton(
                              imageName: 'sms.png',
                              textColor: Colors.white,
                              buttonColor: Colors.blue,
                              buttonText: 'SMS',
                              iconColor: Colors.white,
                              onTap: () => _service.sendSms(number),
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
              CircleImageWithText(text: 'Distance sociale', imagePath: 'images/images.jpg'),
              CircleImageWithText(text: 'Lavez vous les mains', imagePath: 'images/cleanhands.jpg'),
              CircleImageWithText(text: 'Portez un masque', imagePath: 'images/masked.png'),
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
                            Text('Faites votre test', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10.0,),
                            Text('Suivez les instructions pour faire le test', style: TextStyle(color: Colors.white, fontSize: 18.0)),
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