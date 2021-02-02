import 'package:flutter/material.dart';
import '../../components/appbar.dart';

class Coral extends StatelessWidget {
  static String route = "coral";

  final Object data;

  const Coral({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(title: data.name.toString()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data.picture.large),
                fit: BoxFit.fitWidth,
                alignment: AlignmentDirectional.center,
              ),
            ),
          ),
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
          ),
        ],
      ),
    );
  }
}
