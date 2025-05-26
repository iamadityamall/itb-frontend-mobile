import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../dto/mpin_login_request.dart';
import '../service/mpin_login_service.dart';
import '../../../../core/error/api_error.dart';

class MpinLoginController extends GetxController {
  var enteredPin = ''.obs;
  var showPin = false.obs;
  var isLoading = false.obs;

  final _storage = const FlutterSecureStorage();

  void addDigit(String digit) {
    if (enteredPin.value.length < 4) {
      enteredPin.value += digit;
      if (enteredPin.value.length == 4) {
        submitMpin(enteredPin.value);
      }
    }
  }

  void deleteLastDigit() {
    if (enteredPin.isNotEmpty) {
      enteredPin.value =
          enteredPin.value.substring(0, enteredPin.value.length - 1);
    }
  }

  void toggleShowPin() {
    showPin.value = !showPin.value;
  }

  Future<void> submitMpin(String mpin) async {
    isLoading.value = true;
    try {
      final cifNumber = await _storage.read(key: 'cifNumber');
      if (cifNumber == null || cifNumber.isEmpty) {
        throw Exception('CIF number missing in storage.');
      }

      final request = MpinLoginRequest(cifNumber: cifNumber, mpin: mpin);
      final response = await MpinLoginService().loginMpin(request);
      isLoading.value = false;
      Get.snackbar(
        '✅ Success',
        'Welcome, ${response.userName}',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );

      await _storage.write(key: 'mpin', value: mpin);
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed('/dashboard');
    } on ApiError catch (apiError) {
      // Specific server error
      Get.snackbar(
        '❌ Error',
        apiError.detail,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      // Fallback for unexpected errors
      Get.snackbar(
        '❌ Error',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } finally {
      enteredPin.value = ''; // reset input on any failure
      isLoading.value = false;
    }
  }
}
