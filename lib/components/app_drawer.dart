import 'package:flutter/material.dart';
import '../features/camera/camera.dart';
import '../features/search/corals.dart';
import '../features/user/account.dart';
import '../services/auth.dart';

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
          currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text('T', style: TextStyle(color: Colors.black87))),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Colors.deepPurpleAccent,
            ]),
          ),
        ),
        ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            }),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text("My Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Account();
                }),
              );
            }),
        ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Search Corals"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Corals();
                }),
              );
            }),
        ListTile(
            leading: const Icon(Icons.camera),
            title: const Text("Make photo"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Camera();
                }),
              );
            }),
        ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Disconnect"),
            onTap: () async {
              await _auth.signOut();
            }),
        //add more drawer menu here
      ],
    ),
  );
}
