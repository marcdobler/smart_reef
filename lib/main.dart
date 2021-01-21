import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_reef/screens/wrapper.dart';
import 'package:smart_reef/services/auth.dart';

import 'models/userProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserProfile>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Smart Reef',
        theme: ThemeData(
          // Need Move in shared folder
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Color.fromRGBO(3, 218, 197, 1),
        ),
        home: Wrapper(),
      ),
    );
  }
}
