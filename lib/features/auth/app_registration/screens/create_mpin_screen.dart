import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/widgets/create_mpin_app_background.dart';
import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/widgets/create_mpin_app_button.dart';
import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/widgets/cif_verfication_app_background.dart';
import 'package:aifinno_atlas_mobile_app/features/auth/app_registration/screens/widgets/cif_verification_app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/LoadingOverlay.dart';
import '../controller/create_mpin_controller.dart';

class CreateMpinScreen extends StatelessWidget {
  CreateMpinScreen({super.key});

  final controller = Get.put(CreateMpinController());
  final mpinController = TextEditingController();
  final isObscured = true.obs;

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Set MPIN',
                        style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create a secure 4-digit MPIN for quick login.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 40),

                      Obx(
                        () => TextField(
                          controller: mpinController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          obscureText: isObscured.value,
                          decoration: InputDecoration(
                            labelText: 'Enter MPIN',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscured.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                isObscured.value = !isObscured.value;
                              },
                            ),
                            border: OutlineInputBorder(),
                            counterText: '',
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      CifVerificationAppButton(
                        text: "Create MPIN",
                        onPressed: () {
                          controller.submitMpin(mpinController.text.trim());
                        },
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
