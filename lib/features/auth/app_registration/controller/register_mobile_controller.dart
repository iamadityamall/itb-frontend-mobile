import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../dto/register_mobile_request.dart';
import '../service/register_mobile_service.dart';

class RegisterMobileController extends GetxController {
  var isLoading = false.obs;
  var clientName = ''.obs;
  var clientCode = ''.obs;
  var cifNumber = ''.obs;
  var registrationMessage = ''.obs;

  final _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    final args = Get.arguments;
    clientName.value = args.clientName;
    clientCode.value = args.clientCode;
    cifNumber.value = args.cifNumber;
    super.onInit();
  }

  Future<void> registerDevice(String mobileNumber) async {
    isLoading.value = true;

    try {
      final jwt = await _storage.read(key: 'jwt_token');

      final request = RegisterMobileRequest(
        cifNumber: cifNumber.value,
        imei: '352093090123456',
        // dummy for now
        deviceModel: 'Samsung S22',
        // dummy for now
        mobileNumber: mobileNumber,
        userName: 'Amit Kumar',
      );

      final response = await RegisterMobileService().registerDevice(
        request,
        jwt!,
      );

      if (response != null) {
        isLoading.value = false;
        await _storage.write(key: 'cifNumber', value: cifNumber.value);

        Get.snackbar(
          'Success',
          response.message,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.white,
          colorText: Colors.black,
          icon: Icon(Icons.check_circle, color: Colors.green, size: 28),
          titleText: Text(
            'Success',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          messageText: Text(
            response.message,
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
        );

        await Future.delayed(
          Duration(seconds: 2),
        ); // small wait before navigating

        Get.offNamed('/create-mpin');
      }
    } catch (e) {
      registrationMessage.value = e.toString();
      Get.snackbar('Error', registrationMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
