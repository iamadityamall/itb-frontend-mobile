import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/widgets/cif_verfication_app_background.dart';
import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/widgets/cif_verification_app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common_widgets/LoadingOverlay.dart';
import '../controller/register_mobile_controller.dart';

class RegisterMobileScreen extends StatelessWidget {
  RegisterMobileScreen({super.key});

  final controller = Get.put(RegisterMobileController());
  final mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          body: CifVerificationAppBackground(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.clientName.value,
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF4444),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Client Code: ${controller.clientCode.value}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Please register your mobile number.',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 50),
                      CifVerificationAppButton(
                        text: 'Register',
                        onPressed: () {
                          controller.registerDevice(
                            mobileNumberController.text.trim(),
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                      if (controller.registrationMessage.value.isNotEmpty)
                        Text(
                          controller.registrationMessage.value,
                          style: const TextStyle(color: Colors.red),
                        ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
