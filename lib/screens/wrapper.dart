import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_profile.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

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
