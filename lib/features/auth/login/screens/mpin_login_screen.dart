import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aifinno_atlas_mobile_app/features/common_widgets/LoadingOverlay.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app_registration/screens/widgets/cif_verfication_app_background.dart';
import '../controller/mpin_login_controller.dart';

class MpinLoginScreen extends StatelessWidget {
  final controller = Get.put(MpinLoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          body: CifVerificationAppBackground(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 120),
                        child: Column(
                          children: [
                            Text(
                              'iTB',
                              style: GoogleFonts.poppins(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF4444)
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Track your money anywhere everywhere',
                              style: GoogleFonts.poppins(
                                color: Colors.grey[700],
                                fontSize: 12,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Enter your MPIN',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            const SizedBox(height: 40),

                            // PIN indicators
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(4, (index) {
                                String displayChar = '';
                                if (index <
                                    controller.enteredPin.value.length) {
                                  displayChar =
                                      controller.showPin.value
                                          ? controller.enteredPin.value[index]
                                          : '*';
                                }
                                return Container(
                                  width: 40,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        displayChar,
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      SizedBox(height: 4),
                                      Container(height: 2, color: Colors.black),
                                    ],
                                  ),
                                );
                              }),
                            ),

                            const SizedBox(height: 20),

                            // Forgot PIN + Show PIN toggle
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot MPIN?',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  TextButton(

                                    onPressed: () {
                                      controller.toggleShowPin();
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.showPin.value
                                              ? 'Hide MPIN'
                                              : 'Show MPIN',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.grey[700],
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          controller.showPin.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.grey[900],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Number Pad at the bottom
                  Container(
                    color: Colors.grey[200],
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 1.7,
                      padding: EdgeInsets.zero,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ...[
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '',
                          '0',
                        ].map((key) => _buildNumberButton(key)),
                        _buildDeleteButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String key) {
    return GestureDetector(
      onTap: () {
        controller.addDigit(key);
      },
      child: Container(
        margin: EdgeInsets.all(1),
        color: key.isEmpty ? Colors.grey[100] : Colors.white,
        alignment: Alignment.center,
        child: Text(key, style: GoogleFonts.poppins(fontSize: 26)),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: controller.deleteLastDigit,
      child: Container(
        margin: EdgeInsets.all(1),
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Icon(Icons.backspace, size: 28),
      ),
    );
  }
}
