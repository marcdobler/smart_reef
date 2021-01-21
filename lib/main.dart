import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_reef/blocs/theme.dart';
import 'package:smart_reef/screens/wrapper.dart';
import 'package:smart_reef/services/auth.dart';

import 'models/userProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return StreamProvider<UserProfile>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Smart Reef',
        theme: theme.getTheme(),
        home: Wrapper(),
      ),
    );
  }
}
