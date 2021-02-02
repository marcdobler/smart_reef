import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/app_drawer.dart';
import '../../components/appbar.dart';
import '../../features/camera/camera.dart';
import '../../models/probe.dart';
import '../../models/tank.dart';
import 'tank_list.dart';
import '../../services/database_service.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatelessWidget {
  static String route = "coral";

  final DatabaseReference _probeRef = FirebaseDatabase.instance
      .reference()
      .child('X0D67g4Re7dyQdsKc3x3ZglrS662')
      .child('2rCLsa17RZIumfn09fSY');

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Tank>>.value(
      value: DatabaseService().tanks,
      child: Scaffold(
        appBar: const AppBarComponent(title: 'Dashboard'),
        drawer: appDrawerComponent(context),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: _probeRef.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      // final _probe = Probe.fromJson(
                      //     snapshot.data.snapshot.value['probe_temperature_1']);
                      // ignore: avoid_print
                      // print(snapshot.data.snapshot.value.toString());

                      final _probe = Probe.fromJson(
                          snapshot.data.snapshot.value['probe_temperature_1']
                              as Map<dynamic, dynamic>);

                      // ignore: avoid_print
                      print("Temp : ${_probe.measurement}");

                      return Column(
                        children: [
                          TankList(),
                          // const Text('temperature'),
                          // Text("${_probe.measurement.toStringAsFixed(1)}"),
                          SfRadialGauge(axes: <RadialAxis>[
                            RadialAxis(
                                minimum: 18,
                                maximum: 28,
                                showLabels: false,
                                showTicks: false,
                                radiusFactor: 0.7,
                                axisLineStyle: AxisLineStyle(
                                    cornerStyle: CornerStyle.bothCurve,
                                    color: Colors.black12,
                                    thickness: 25),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                      value: _probe.measurement.toDouble()
                                          as double,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 25,
                                      gradient: const SweepGradient(
                                          colors: <Color>[
                                            Color(0xFFCC2B5E),
                                            Color(0xFF753A88)
                                          ],
                                          stops: <double>[
                                            0.25,
                                            0.75
                                          ])),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 0.2,
                                      widget: Text(
                                          '${_probe.measurement.toStringAsFixed(1)} ${_probe.measurementUnit}',
                                          style: const TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFCC2B5E))))
                                ])
                          ])
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text("NO DATA YET"),
                      );
                    }
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final User user = FirebaseAuth.instance.currentUser;
            await DatabaseService(uid: user.uid)
                .updateUserData(40, 30, 30, 'Pico Reef 2', 'SPS');
          },
          tooltip: 'Add tank',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
