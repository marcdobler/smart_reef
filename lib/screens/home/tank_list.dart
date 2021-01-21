import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_reef/models/tank.dart';
import 'package:smart_reef/screens/home/tank_tile.dart';

class TankList extends StatefulWidget {
  @override
  _TankListState createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  @override
  Widget build(BuildContext context) {
    final tanks = Provider.of<List<Tank>>(context);

    return ListView.builder(
      // The getter 'length' was called on null.
      // Receiver: null
      // Tried calling: length
      itemCount: tanks.length ?? 0,
      itemBuilder: (context, index) {
        return TankTile(tank: tanks[index]);
      },
    );
  }
}
