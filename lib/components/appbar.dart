import 'package:flutter/material.dart';
import 'package:smart_reef/screens/notifications.dart';

Widget appBarComponent(BuildContext context, String title) {
  return AppBar(
    //background color of Appbar to green
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_none),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Notifications();
            }),
          );
        },
      )
    ],
  );
}
