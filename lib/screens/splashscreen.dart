import 'package:flutter/material.dart';

@immutable
class Splashscreen extends StatelessWidget {
  static String route = "splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(
                      Icons.account_box,
                      color: Colors.deepPurple,
                      size: 50.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10.0)),
                  const Text(
                    "Smart Reef",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(),
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                const Text(
                  "IoT reef tank manager",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    ));
  }
}
