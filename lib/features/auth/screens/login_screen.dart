import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import 'device_registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _cifController = TextEditingController();
  final Dio _dio = Dio();
  final String _validateCifUrl =
      'http://172.16.16.104:8080/api/auth/cif/validate';

  final storage = GetStorage();

  // Modify your _validateCif method in LoginScreen
  Future<void> _validateCif() async {
    final String cif = _cifController.text.trim();
    if (cif.isEmpty) {
      _showSnackbar("Please enter CIF / User ID");
      return;
    }

    try {
      // Show loading dialog
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Simulate delay
      await Future.delayed(Duration(seconds: 2));

      final response = await _dio.post(
        _validateCifUrl,
        data: {"cifNumber": cif},
      );

      // Close loader
      Get.back();

      if (response.data['status'] == 'Success') {
        storage.write('cifNumber', cif);
        final bool registered = response.data['payload']['registered'];
        storage.write("isRegistered", registered);

        Get.snackbar(
          'Success',
          'CIF Validated',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );

        // Small delay for feel
        await Future.delayed(Duration(seconds: 1));
        Get.offAllNamed('/register');
      } else {
        Get.snackbar(
          'Invalid CIF',
          response.data['message'] ?? 'Not Registered',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.back(); // Close dialog in case of error
      Get.snackbar(
        'Error',
        'Validation failed: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void _showSnackbar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.ternary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 200),
                    Center(
                      child: Text(
                        "iTB",
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Login to i-Transaction Banking",
                      style: GoogleFonts.poppins(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: _cifController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        // light gray background
                        labelText: "Enter CIF / User ID *",
                        labelStyle: GoogleFonts.poppins(color: AppColors.textGrey, fontSize: 11),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.secondary,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.secondary,
                            width: 2,
                          ), // color when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 50),
                    //Spacer(),
                    ElevatedButton(
                      onPressed: _validateCif,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},

                      child: Text(
                        "Trouble Logging In ?",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    // OutlinedButton(
                    //   onPressed: () {},
                    //   child: Text("OMNI Channel New User Registration"),
                    // ),
                    // SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: DropdownButtonFormField<String>(
                    //         value: 'Savings Account',
                    //         items:
                    //             ['Savings Account', 'Current Account']
                    //                 .map(
                    //                   (label) => DropdownMenuItem(
                    //                     child: Text(label),
                    //                     value: label,
                    //                   ),
                    //                 )
                    //                 .toList(),
                    //         onChanged: (_) {},
                    //         decoration: InputDecoration(
                    //           border: OutlineInputBorder(),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(width: 10),
                    //     ElevatedButton(onPressed: () {}, child: Text("Go")),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
