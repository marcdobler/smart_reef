import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_profile.dart';
import 'screens/wrapper.dart';
import 'services/auth.dart';
import 'shared/loading.dart';

void logError(String code, String message) =>
    // ignore: avoid_print
    print('Error: $code\nError Message: $message');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const Text('error');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<UserProfile>.value(
              value: AuthService().user,
              child: MaterialApp(
                title: 'Smart Reef',
                home: Wrapper(),
                theme: ThemeData(
                  brightness: Brightness.light,
                  accentColor: const Color.fromRGBO(0, 226, 251, 1),
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.light,
                  accentColor: const Color.fromRGBO(24, 25, 104, 1),
                ),
                debugShowCheckedModeBanner: false,
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Loading();
        });
  }
}
