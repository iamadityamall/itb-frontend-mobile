import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'features/auth/controller/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();

  // Register AuthController and initialize device info
  final authController = Get.put(AuthController());
  await authController.initDeviceDetails();
  final box = GetStorage();
  final isRegistered = box.read('isRegistered') ?? false;

  runApp(MyApp(initialRoute: isRegistered ? '/' : '/'));
}
