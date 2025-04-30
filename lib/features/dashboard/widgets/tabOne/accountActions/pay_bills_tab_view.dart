import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';

class PayBillsTabView extends StatelessWidget {
  const PayBillsTabView({super.key});

  final List<Map<String, dynamic>> _bills = const [
    {
      'logo': 'assets/images/electricity_logo.png',
      'title': 'Electricity bill',
      'due': 'Pay by 29 Apr',
      'amount': '₹1230.00',
      'cashback': 'Cashback ₹20',
    },
    {
      'logo': 'assets/images/airtel_logo.png',
      'title': 'Airtel bill',
      'due': 'Pay by 05 May',
      'amount': '₹599.00',
    },
    {
      'logo': 'assets/images/bwssb_logo.png',
      'title': 'BWSSB bill',
      'due': 'Pay by 05 May',
      'amount': '₹599.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔘 Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Upcoming bills',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // handle new transfer
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
                child: Text(
                  '+ New Biller',
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 🧾 Bill List
          ..._bills.map((bill) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🔵 Logo
                  CircleAvatar(
                    backgroundImage: AssetImage(bill['logo']),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),

                  // 📝 Title + Due + Cashback
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (bill['cashback'] != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              bill['cashback'],
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        const SizedBox(height: 4),
                        Text(
                          bill['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(bill['due'], style: GoogleFonts.poppins(fontSize: 10)),
                      ],
                    ),
                  ),

                  // ✅ Pay Button
                  ElevatedButton(
                    onPressed: () {
                      // handle new transfer
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                    ),
                    child: Text(
                      'Pay ${bill['amount']}',
                      style: GoogleFonts.poppins(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          const SizedBox(height: 10),

          // 🔗 View Previous
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigate to previous bills screen
              },
              child: Text(
                'View Previous',
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
