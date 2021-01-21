import 'package:flutter/material.dart';
import 'package:smart_reef/models/tank.dart';

class TankTile extends StatelessWidget {
  final Tank tank;

  TankTile({this.tank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.deepPurple,
          ),
          title: Text(tank.name),
          subtitle: Text(tank.type),
        ),
      ),
    );
  }
}
