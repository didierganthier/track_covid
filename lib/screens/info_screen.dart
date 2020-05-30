import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'dart:io';
import 'package:trackcovid/services/calls_and_messages_service.dart';
import 'package:trackcovid/services/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trackcovid/assets/my_app_icons.dart';

class InfoScreen extends StatefulWidget {

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void launchWhatsApp(
      {@required String phone,
        @required String message,
      }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  void launchUrl({@required String url}) async {
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String email = 'didierganthierperan@gmail.com';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 600,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              Text(
                'Didier Ganthier',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'DEVELOPPEUR',
                style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5
                ),
              ),
              Divider(
                color: Colors.white,
                indent: 40.0,
                endIndent: 40.0,
              ),
              GestureDetector(
                onTap: () => FlutterOpenWhatsapp.sendSingleMessage('+50944193238', 'Hello Mr Ganthier'),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(
                      MyCustomIcons.whatsapp,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "+509 4419-3238",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _service.sendEmail(email),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "didierganthierperan@gmail.com",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => launchUrl(url: 'https://twitter.com/didierganthier_'),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(
                      MyCustomIcons.twitter,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "didierganthier_",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => launchUrl(url: 'https://github.com/didierganthier'),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(
                      MyCustomIcons.github,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "didierganthier",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
