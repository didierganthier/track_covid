import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:trackcovid/screens/advice_screen.dart';
import 'package:trackcovid/screens/home_screen.dart';
import 'package:trackcovid/screens/info_screen.dart';
import 'package:trackcovid/screens/stats_screen.dart';
import 'package:trackcovid/services/calls_and_messages_service.dart';
import 'package:trackcovid/services/service_locator.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPage = 0;
  
  final _pageOptions = [
    HomeScreen(),
    StatsScreen(),
    Quizzler(),
    InfoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Track Covid',
      home: SafeArea(
        child: Scaffold(
          body: _pageOptions[selectedPage],
          bottomNavigationBar: FancyBottomNavigation(
        tabs: [
        TabData(iconData: Icons.home, title: "Accueil"),
        TabData(iconData: Icons.insert_chart, title: "Chiffres"),
        TabData(iconData: Icons.insert_emoticon, title: "Jouer"),
        TabData(iconData: Icons.info, title: 'Infos')
        ],
        onTabChangedListener: (position) {
          setState(() {
            selectedPage = position;
          });
        },
    ),
        ),
      ),
    );
  }
}


