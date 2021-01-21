import 'package:smart_reef/screens/home/home.dart';
import 'package:smart_reef/screens/user/account.dart';
import 'package:smart_reef/screens/search/coral.dart';
import 'package:smart_reef/screens/user/general_settings.dart';
import 'package:smart_reef/screens/splashscreen.dart';
import 'package:smart_reef/screens/tank.dart';
import 'package:smart_reef/screens/notifications.dart';

getRoutes() {
  return {
    Account.route: (context) => Account(),
    Coral.route: (context) => Coral(data: null),
    Home.route: (context) => Home(),
    GeneralSettings.route: (context) => GeneralSettings(),
    Splashscreen.route: (context) => Splashscreen(),
    Tank.route: (context) => Tank(index: null),
    Notifications.route: (context) => Notifications(),
  };
}
