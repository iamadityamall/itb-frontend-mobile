import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/cif_verification_screen.dart';
import 'package:aifinno_atlas_mobile_app/features/auth/login/screens/mpin_login_screen.dart';
import 'package:get/get.dart';

import '../features/auth/app_registration/screens/create_mpin_screen.dart';
import '../features/auth/app_registration/screens/register_mobile_screen.dart';
import '../features/dashboard/screens/dashboard_page.dart';

class AppRoutes {
  static final routes = [

    GetPage(name: "/cif-verification", page: () => CifVerificationScreen()),
    GetPage(name: '/dashboard', page: () => DashboardPage()),
    GetPage(name: '/register-mobile-device', page: () => RegisterMobileScreen()),
    GetPage(name: '/create-mpin', page: () => CreateMpinScreen()),
    GetPage(name: '/login-mpin', page: () => MpinLoginScreen()),
    // GetPage(name: '/', page: () => LoginScreen()),
    // GetPage(name: "/register", page: () => DeviceRegistrationScreen()),
    // GetPage(name: "/mpin", page: () => EnterMpinScreen()),
    // GetPage(name: "/mpin-login", page: () => MpinLoginScreen()),
    //
    // // Later: Dashboard page
    //
    // GetPage(name: '/cif-verification', page: () => CifVerifyScreen()),
    // GetPage(
    //   name: '/register-mobile',
    //   page: () => RegisterMobileScreen(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut(() => RegisterMobileController());
    //   }),
    // ),


  ];
}
