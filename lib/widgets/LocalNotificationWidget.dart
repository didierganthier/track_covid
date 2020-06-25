import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() => _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings("launcher_icon");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
