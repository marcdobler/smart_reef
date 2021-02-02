import 'package:flutter/material.dart';
import '../components/appbar.dart';

class Notifications extends StatelessWidget {
  static String route = "notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(title: 'Notifications'),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.woolha.com/media/2020/03/eevee.png'),
            ),
            title: const Text('Reef Lab'),
            subtitle: Text(
              'SPS dominant - Start 12-15-2020',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            trailing: const Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}

Widget makeItem(BuildContext context, int index) {
  return null;
}
