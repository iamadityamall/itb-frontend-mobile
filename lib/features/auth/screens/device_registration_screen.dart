import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/auth_controller.dart';

class DeviceRegistrationScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final storage = GetStorage();

  DeviceRegistrationScreen({super.key});

  Future<void> _registerDevice(BuildContext context) async {
    try {
      // Show loading dialog
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Simulate a slight delay
      await Future.delayed(Duration(seconds: 2));

      final dio = Dio();
      final response = await dio.post(
        'http://172.16.16.104:8080/api/auth/device/register',
        data: {
          'cifNumber': storage.read("cifNumber"),
          'imei': authController.imei.value,
          'deviceName': authController.deviceName.value,
        },
      );

      // Close loading
      Get.back();

      if (response.data['status'] == 'Success') {
        // Show success message
        Get.snackbar(
          'Success',
          'Device registered successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );

        // Delay before navigation to allow user to see snackbar
        await Future.delayed(Duration(seconds: 2));

        if (storage.read("isRegistered")) {
          Get.offAllNamed("/mpin-login");
        } else {
          Get.offAllNamed("/mpin");
        }
      } else {
        Get.back(); // Ensure loader is closed
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Registration failed')));
      }
    } catch (e) {
      Get.back(); // Ensure loader is closed
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  Text(
                    'Register Mobile Number to iTB Servers',
                    style: GoogleFonts.poppins(
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We need to send an SMS from your phone to verify and register your mobile number.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textBlack,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _registerDevice(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(color: AppColors.textWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
