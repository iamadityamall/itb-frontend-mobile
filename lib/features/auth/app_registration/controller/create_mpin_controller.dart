import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dto/create_mpin_request.dart';
import '../service/create_mpin_service.dart';

class CreateMpinController extends GetxController {
  var isLoading = false.obs;
  var cifNumber = ''.obs;

  final _storage = const FlutterSecureStorage();

  @override
  void onInit() async {
    super.onInit();
    // 🔥 Read CIF number from secure storage
    final cif = await _storage.read(key: 'cifNumber');
    cifNumber.value = cif ?? '';

    if (cif == null) {
      Get.snackbar('Error', 'CIF number not found in storage.');
    }
  }

  Future<void> submitMpin(String mpin) async {
    if (mpin.length != 4) {
      Get.snackbar('Error', 'MPIN must be exactly 4 digits.');
      return;
    }

    isLoading.value = true;
    try {
      final jwt = await _storage.read(key: 'jwt_token');

      final request = CreateMpinRequest(cifNumber: cifNumber.value, mpin: mpin);
      final response = await CreateMpinService().createMpin(request, jwt!);

      if (response.status == '200') {
        Get.snackbar(
          '✅ Success',
          response.message,
          snackPosition: SnackPosition.TOP,
          icon: const Icon(Icons.check_circle, color: Colors.green),
          backgroundColor: Colors.white,
          colorText: Colors.black,
          duration: const Duration(seconds: 2),
        );

        await Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed('/dashboard');
      } else {
        Get.snackbar('Error', response.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
