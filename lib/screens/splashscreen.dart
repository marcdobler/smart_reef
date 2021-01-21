import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  static String route = "splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.deepPurpleAccent),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(
                            Icons.account_box,
                            color: Colors.deepPurple,
                            size: 50.0,
                          )),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Smart Reef",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      "IoT reef tank manager",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                )),
          ],
        )
      ],
    ));
  }
}
