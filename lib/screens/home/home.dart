import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_reef/components/app_drawer.dart';
import 'package:smart_reef/components/appbar.dart';
import 'package:smart_reef/models/tank.dart';
import 'package:smart_reef/services/database.dart';

class Home extends StatelessWidget {
  static String route = "coral";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Tank>>.value(
      value: DatabaseService().tanks,
      child: Scaffold(
        appBar: appBarComponent(context, 'Dashboard'),
        drawer: appDrawerComponent(context),
        body: Text('Home'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add tank',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
