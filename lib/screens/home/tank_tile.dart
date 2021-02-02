import 'package:flutter/material.dart';
import '../../models/tank.dart';

class TankTile extends StatelessWidget {
  final Tank tank;

  const TankTile({this.tank});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.25,
      child: Card(
        child: Column(
          children: [
            Image.asset('assets/images/tank-${tank.id}.jpg'),
            ListTile(
              title: Text(tank.name,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(tank.id),
            ),
            const Divider(),
            ListTile(
              title: const Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.only(top: 8.0),
    //   child: Card(
    //     child: ListTile(
    //       leading: CircleAvatar(
    //         radius: 25.0,
    //         backgroundColor: Colors.deepPurple,
    //       ),
    //       title: Text(tank.name),
    //       subtitle: Text(tank.type),
    //     ),
    //   ),
    // );
  }
}
