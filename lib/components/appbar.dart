import 'package:flutter/material.dart';
import '../screens/notifications.dart';

class AppBarComponent extends PreferredSize {
  const AppBarComponent({this.title});

  final String title;

  @override
  Size get preferredSize =>
      const Size.fromHeight(50); // set height of your choice

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
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
}
