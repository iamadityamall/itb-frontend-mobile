import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationLoanSuggestionCard extends StatelessWidget {
  const EducationLoanSuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFB2EBF2), // Light cyan background
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          // Right-side Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recently, you paid ₹36,500 towards IIMB college as your semester fees.",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Good time to evaluate our Education Loans offered at attractive interest rates and easy repayment options.",
                style: GoogleFonts.poppins(fontSize: 10),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    "Get Loan Now",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Left illustration box (replace with image later)
          Positioned(
            bottom: -0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Adjust as needed
              child: SizedBox(
                //height: 120,
                width: 100,
                child: Image.asset(
                  'assets/images/books-logo.avif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
