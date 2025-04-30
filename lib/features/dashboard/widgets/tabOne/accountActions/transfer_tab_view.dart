import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';

class TransferTabView extends StatelessWidget {
  const TransferTabView({super.key});

  final List<Map<String, dynamic>> _transfers = const [
    {
      'date': '10 Mar',
      'txnId': '987629314734',
      'note': 'Towards house rent',
      'amount': '₹20,000.00',
    },
    {
      'date': '02 Mar',
      'txnId': '120948469370',
      'note': 'For household expenses',
      'amount': '₹5,000.00',
    },
    {
      'date': '25 Feb',
      'txnId': '098876423456',
      'note': 'Shool van fees',
      'amount': '₹500.00',
    },
    {
      'date': '15 Feb',
      'txnId': '751496803958',
      'note': 'Shool fees',
      'amount': '₹3,500.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Recent Transfers',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Transfer List
          ..._transfers.map(
            (txn) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          txn['date'],
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          txn['txnId'],
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          txn['note'],
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                  ),

                  // Right side - Amount
                  Text(
                    txn['amount'],
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // View More (underline text)
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                // TODO: Add navigation to full transfer history
              },
              child: Text(
                'View more',
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
