import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dto/cif_verification_request.dart';
import '../service/cif_verification_service.dart';
import '../../../../core/error/api_error.dart';

class CifVerificationController extends GetxController {
  var isLoading = false.obs;
  var isLoginDisabled = false.obs;
  var attemptMessage = ''.obs; // ✅ NEW: holds attempt feedback

  Future<void> verifyCif(CifVerificationRequest request) async {
    // ✅ RESET states on every new attempt
    isLoginDisabled.value = false;
    attemptMessage.value = '';

    isLoading.value = true;

    try {
      final response = await CifVerificationService().verifyCif(request);

      if (response != null) {
        // ✅ Clear any old attempt/lock message
        attemptMessage.value = '';
        isLoginDisabled.value = false;

        isLoading.value = false;
        Get.snackbar(
          'Success',
          response.message,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
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
          Duration(seconds: 3),
        ); // small wait before navigating


        Get.offNamed('/register-mobile-device', arguments: response);
      }
    } on ApiError catch (apiError) {
      print('ApiError caught: ${apiError.errorCode}, ${apiError.detail}');

      switch (apiError.errorCode) {
        case 'INVALID_CATCH_PHRASE':
          attemptMessage.value = apiError.detail;
          Get.snackbar('Invalid Catchphrase', apiError.detail);
          break;

        case 'CIF_NOT_FOUND':
          attemptMessage.value = '';
          Get.snackbar('CIF Not Found', apiError.detail);
          break;

        case 'ATTEMPT_LIMIT_EXCEEDED':
          isLoginDisabled.value = true;
          attemptMessage.value =
              'This CIF has been locked. Please contact the branch.';
          Get.snackbar(
            'Account Locked',
            'Too many invalid attempts. Please contact the branch.',
          );
          break;

        default:
          attemptMessage.value = '';
          Get.snackbar('Error', apiError.detail);
      }
    } catch (e) {
      print('Unexpected error: $e');
      attemptMessage.value = '';
      Get.snackbar('Error', 'An unexpected error occurred.');
    } finally {
      isLoading.value = false;
    }
  }
}
