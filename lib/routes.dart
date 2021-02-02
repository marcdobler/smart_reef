import 'features/camera/camera.dart';
import 'features/user/account.dart';
import 'features/user/general_settings.dart';
import 'screens/home/home.dart';
import 'screens/notifications.dart';
import 'screens/splashscreen.dart';
import 'screens/tank.dart';

getRoutes() {
  return {
    Account.route: (context) => Account(),
    Camera().route: (context) => Camera(),
    Home.route: (context) => Home(),
    GeneralSettings.route: (context) => GeneralSettings(),
    Splashscreen.route: (context) => Splashscreen(),
    Tank.route: (context) => const Tank(index: null),
    Notifications.route: (context) => Notifications(),
  };
}
