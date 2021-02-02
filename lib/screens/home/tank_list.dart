import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/tank.dart';
import 'tank_tile.dart';

class TankList extends StatefulWidget {
  @override
  _TankListState createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final tanks = Provider.of<List<Tank>>(context);

    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: RefreshIndicator(
        onRefresh: refreshList,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tanks.length ?? 0,
          itemBuilder: (context, index) {
            return TankTile(tank: tanks[index]);
          },
        ),
      ),
    );
  }
}
