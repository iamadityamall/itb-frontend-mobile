import 'package:get/get.dart';

import '../features/auth/screens/mpin_login_screen.dart';
import '../features/auth/screens/device_registration_screen.dart';
import '../features/auth/screens/login_page.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/set-mpin-screen.dart';
import '../features/dashboard/screens/dashboard_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: "/register", page: () => DeviceRegistrationScreen()),
    GetPage(name: "/mpin", page: () => EnterMpinScreen()),
    GetPage(name: "/mpin-login", page: () => MpinLoginScreen()),
    // Later: Dashboard page
    GetPage(name: '/dashboard', page: () => DashboardPage()),
  ];
}
