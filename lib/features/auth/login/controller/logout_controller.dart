import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../service/logout_service.dart';
import '../dto/logout_request.dart';

class LogoutController extends GetxController {
  var isLoading = false.obs;
  final _storage = const FlutterSecureStorage();

  Future<void> logout() async {
    String cifNumber = await _storage.read(key: 'cifNumber').toString();
    String mpin = await _storage.read(key: 'mpin').toString();

    isLoading.value = true;

    try {
      final response = await LogoutService().logout(
        LogoutRequest(cifNumber: cifNumber, mpin: mpin),
      );

      if (response != null) {
        Get.snackbar(
          '✅ Success',
          response.message,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
        );

        await Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed('/login-mpin');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
