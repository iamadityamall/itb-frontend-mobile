import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {

  var isLoading = false.obs;

  final employeeId = ''.obs;
  final password = ''.obs;

  var cifNumber = ''.obs;
  var imei = ''.obs;
  var deviceName = ''.obs;

  final storage = GetStorage();

  void setCif(String cif) {
    cifNumber.value = cif;
    storage.write('cifNumber', cif);
  }


  void loadCachedDeviceInfo() {
    imei.value = storage.read('imei') ?? '';
    deviceName.value = storage.read('deviceName') ?? '';
  }



  void login() async{
    if(employeeId.value.isEmpty || password.value.isEmpty){
      Get.snackbar("Error", "Please enter both Employee ID and Password");
      return;
    }
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed('/dashboard');
  }





  Future<void> initDeviceDetails() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      imei.value = androidInfo.id ?? 'unknown_imei';
      deviceName.value = androidInfo.model ?? 'unknown_device';
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      imei.value = iosInfo.identifierForVendor ?? 'unknown_imei';
      deviceName.value = iosInfo.utsname.machine ?? 'unknown_device';
    }

    // Save to local storage
    storage.write('imei', imei.value);
    storage.write('deviceName', deviceName.value);
  }


}