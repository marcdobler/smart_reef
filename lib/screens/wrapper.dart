import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_reef/models/userProfile.dart';
import 'package:smart_reef/screens/authenticate/authenticate.dart';
import 'package:smart_reef/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile>(context);

    // Access for account registered
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
