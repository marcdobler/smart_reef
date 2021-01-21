import 'package:flutter/material.dart';
import 'package:smart_reef/screens/user/account.dart';
import 'package:smart_reef/screens/search/corals.dart';
import 'package:smart_reef/services/auth.dart';

Widget appDrawerComponent(BuildContext context) {
  final AuthService _auth = AuthService();

  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("TakeoffAndroid",
              style: Theme.of(context).textTheme.headline6),
          accountEmail: Text("takeoffandroid@gmail.com",
              style: Theme.of(context).textTheme.bodyText2),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text('T', style: TextStyle(color: Colors.black87))),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.deepPurple,
                  Colors.deepPurpleAccent,
                ]),
          ),
        ),
        ListTile(
            leading: Icon(Icons.home),
            title: new Text("Home"),
            onTap: () {
              Navigator.pop(context);
            }),
        ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Account();
                }),
              );
            }),
        ListTile(
            leading: Icon(Icons.search),
            title: Text("Search Corals"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Corals();
                }),
              );
            }),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Disconnect"),
            onTap: () async {
              await _auth.signOut();
            }),
        //add more drawer menu here
      ],
    ),
  );
}
