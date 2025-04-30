import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HassleFreeLoansGrid extends StatelessWidget {
  const HassleFreeLoansGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> loanOptions = [
      {'icon': Icons.person_outline, 'label': 'Personal Loan'},
      {'icon': Icons.home_outlined, 'label': 'Home Loan'},
      {'icon': Icons.menu_book_outlined, 'label': 'Education Loan'},
      {'icon': Icons.directions_car_outlined, 'label': 'Vehicle Loan'},
      {'icon': Icons.work_outline, 'label': 'Business Loan'},
      {'icon': Icons.credit_card_outlined, 'label': 'Credit Card Loan'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5), // light background like your screenshot
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hassle Free Loans at Low Interest",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2.8,
            children: loanOptions.map((option) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(option['icon'], color: Colors.teal, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        option['label'],
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children:  [
                Text(
                  "View More",
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
