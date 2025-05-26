import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CifVerificationAppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // ✅ make nullable

  const CifVerificationAppButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: GoogleFonts.poppins(fontSize: 14)),
    );
  }
}
