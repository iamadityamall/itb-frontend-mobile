import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/auth_controller.dart';

class EnterMpinScreen extends StatefulWidget {
  @override
  _EnterMpinScreenState createState() => _EnterMpinScreenState();
}

class _EnterMpinScreenState extends State<EnterMpinScreen> {
  final TextEditingController _mpinController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final Dio _dio = Dio();
  final storage = GetStorage();

  bool _isButtonEnabled = false;

  void _validateInputs() {
    setState(() {
      _isButtonEnabled =
          _mpinController.text.length == 6 &&
          _mpinController.text == _confirmController.text;
    });
  }

  Future<void> _submitMpin() async {
    final authController = Get.find<AuthController>();
    final String cifNumber = storage.read("cifNumber");
    final String mpin = _mpinController.text;

    try {
      final response = await _dio.post(
        'http://172.16.16.104:8080/api/auth/mpin/register',
        data: {'cifNumber': cifNumber, 'mpin': mpin},
      );

      if (response.data['status'] == 'Success') {
        storage.write('isRegistered', true);
        Get.offAllNamed('/mpin-login');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('MPIN registration failed')));
      }
    } catch (e) {
      print("e: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    _mpinController.addListener(_validateInputs);
    _confirmController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _mpinController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Enter New MPIN',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _mpinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      labelText: 'Enter MPIN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _confirmController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      labelText: 'Confirm MPIN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isButtonEnabled ? _submitMpin : null,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor:
                          _isButtonEnabled ? AppColors.secondary : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Submit MPIN',
                      style: GoogleFonts.poppins(color: AppColors.textWhite),
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
