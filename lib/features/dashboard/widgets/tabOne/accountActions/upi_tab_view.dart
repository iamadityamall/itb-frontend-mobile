import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';

class UpiTabView extends StatelessWidget {
  const UpiTabView({super.key});

  final List<Map<String, String>> _transactions = const [
    {'date': '14 Mar', 'txnId': 'ApolPha34561', 'amount': '₹1,000.00'},
    {'date': '02 Mar', 'txnId': 'ReliFre023432', 'amount': '₹2,000.00'},
    {'date': '20 Feb', 'txnId': 'LifeSt982340', 'amount': '₹3,500.00'},
    {'date': '13 Feb', 'txnId': 'MKReta32432', 'amount': '₹200.00'},
    {'date': '09 Feb', 'txnId': 'GPay002123', 'amount': '₹4,500.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Recent Transactions',
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
                  'New Payment',
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

          // Transaction List
          ..._transactions.map(
            (txn) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left - Date and Txn
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          txn['date']!,
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          txn['txnId']!,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right - Amount
                  Text(
                    txn['amount']!,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // View Previous Link
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigate to full history
              },
              child: Text(
                'View previous',
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
