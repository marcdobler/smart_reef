import 'package:flutter/material.dart';
import '../../components/appbar.dart';

class Account extends StatelessWidget {
  static String route = "account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarComponent(title: 'Account'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(child: Image.asset("assets/undraw.co/cards.png")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
