import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/LoadingOverlay.dart';
import '../../app_registration/controller/cif_verification_controller.dart';
import '../../app_registration/dto/cif_verification_request.dart';
import '../../app_registration/screens/widgets/cif_verfication_app_background.dart';
import '../../app_registration/screens/widgets/cif_verification_app_button.dart';
import '../../app_registration/screens/widgets/cif_verification_app_text_field.dart';

class CifVerificationScreen extends StatelessWidget {
  CifVerificationScreen({super.key});

  final controller = Get.put(CifVerificationController());
  final cifController = TextEditingController();
  final catchPhraseController = TextEditingController();

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
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF4444),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Welcome! Login to access the iTB features.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      CifVerificationAppTextField(
                        controller: cifController,
                        label: 'CIF Number',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      CifVerificationAppTextField(
                        controller: catchPhraseController,
                        label: 'Catchphrase',
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),

                      CifVerificationAppButton(
                        text: "Submit",
                        onPressed: () {
                          final request = CifVerificationRequest(
                            cifNumber: cifController.text.trim(),
                            catchPhrase: catchPhraseController.text.trim(),
                            imei: '1111',
                            // dummy
                            deviceModel: '1111',
                            mobileNumber: '1111',
                          );
                          controller.verifyCif(request);
                        },
                      ),

                      const SizedBox(height: 20),

                      // Show warning or lock message
                      if (controller.isLoginDisabled.value)
                        Text(
                          'CIF number has been locked. Please contact the branch for a new passcode.',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )
                      else if (controller.attemptMessage.isNotEmpty)
                        Text(
                          controller.attemptMessage.value,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
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
