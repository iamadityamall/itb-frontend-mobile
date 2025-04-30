import 'dart:io';
import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/auth_controller.dart';

class MpinLoginScreen extends StatefulWidget {
  const MpinLoginScreen({super.key});

  @override
  State<MpinLoginScreen> createState() => _MpinLoginScreenState();
}

class _MpinLoginScreenState extends State<MpinLoginScreen> {
  final storage = GetStorage();
  final AuthController authController = Get.find();
  final Dio dio = Dio();

  String enteredPin = '';
  bool obscureText = true;

  void _onKeyPress(String value) {
    if (value == 'del') {
      if (enteredPin.isNotEmpty) {
        setState(
          () => enteredPin = enteredPin.substring(0, enteredPin.length - 1),
        );
      }
    } else if (enteredPin.length < 7) {
      setState(() => enteredPin += value);
      if (enteredPin.length == 6) {
        _loginWithMpin();
      }
    }
  }

  Future<void> _loginWithMpin() async {
    try {
      // Show loading dialog
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Simulate delay for better UX
      await Future.delayed(Duration(seconds: 2));

      final response = await dio.post(
        'http://172.16.16.104:8080/api/auth/login',
        data: {
          "cifNumber": storage.read("cifNumber"),
          "mpin": enteredPin,
          "imei": authController.imei.value,
        },
      );

      // Close loader
      Get.back();

      if (response.data['status'] == 'Success') {
        // Show success message
        Get.snackbar(
          'Success',
          response.data['message'] ?? 'Login successful',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );

        // Delay before navigating
        await Future.delayed(Duration(seconds: 2));
        Get.offAllNamed('/dashboard');
      } else {
        Get.snackbar(
          'Error',
          response.data['message'] ?? 'Invalid MPIN',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        setState(() => enteredPin = '');
      }
    } catch (e) {
      Get.back(); // Close loader if error occurs
      Get.snackbar(
        'Error',
        'Failed to login: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      setState(() => enteredPin = '');
    }
  }

  Widget _buildPinBox(int index) {
    return Container(
      width: 40,
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: Colors.grey)),
      ),
      child: Text(
        obscureText
            ? (index < enteredPin.length ? '•' : '')
            : (index < enteredPin.length ? enteredPin[index] : ''),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () => _onKeyPress(value),
      child: Container(
        alignment: Alignment.center,
        child:
            value == 'del'
                ? const Icon(
                  Icons.backspace_outlined,
                  color: AppColors.secondary,
                )
                : Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: AppColors.primary,
                  ),
                ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', 'del'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -120,
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary,
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 30,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.ternary,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 200),
              Text(
                "iTB's own transaction app",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text("ENTER YOUR PIN", style: GoogleFonts.poppins(fontSize: 16)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) => _buildPinBox(index)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot PIN ?",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () => setState(() => obscureText = !obscureText),
                    child: Row(
                      children: [
                        Text(
                          "Show PIN",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GridView.builder(
                shrinkWrap: true,
                itemCount: keys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(20),
                itemBuilder: (_, index) {
                  if (keys[index] == '') return const SizedBox();
                  return ElevatedButton(
                    onPressed: () => _onKeyPress(keys[index]),
                    child: _buildKey(keys[index]),
                  );
                },
              ),
              const SizedBox(height: 10),
              Text("Version 1.0.0", style: GoogleFonts.poppins(fontSize: 10)),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
