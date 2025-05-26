import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetStorage
  await GetStorage.init();

  // Load env variables
  await dotenv.load(fileName: ".env");

  final box = GetStorage();
  final isRegistered = box.read('isRegistered') ?? false;

  runApp(MyApp(initialRoute: isRegistered ? '/login-mpin' : '/cif-verification'));
}
