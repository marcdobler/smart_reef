import 'package:flutter/material.dart';
import 'package:smart_reef/components/appbar.dart';

class Account extends StatelessWidget {
  static String route = "account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(context, 'Account'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(child: Image.asset("assets/undraw.co/cards.png")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  "Back to Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
              ),
            )
          ],
        ));
  }
}
