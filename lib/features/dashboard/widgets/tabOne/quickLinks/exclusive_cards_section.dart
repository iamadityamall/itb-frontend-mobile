import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exclusive_card.dart';

class ExclusiveCardsSection extends StatelessWidget {
  const ExclusiveCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'bgColor': Colors.purpleAccent,
        'title':
            "Congratulations for your Pre Approved Personal Loan of ₹2 Lakhs",
        'subtitle': "Loan disbursal in 1 minute\nEMI at ₹2,149.00 onwards",
        'buttonText': "Get Now",
      },
      {
        'bgColor': Colors.deepOrange,
        'title': "Drive home with a pre-approved car loan",
        'subtitle': "EMI as low as ₹2,300 | 0% Processing fee*",
        'buttonText': "Apply Now",
      },
      {
        'bgColor': Colors.greenAccent,
        'title': "Get Instant Gold Loan with doorstep service",
        'subtitle': "Disbursal in 15 minutes | Easy KYC",
        'buttonText': "Check Offer",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Exclusive from CMS",
              style: GoogleFonts.poppins(
                color: AppColors.textGrey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16, right: 8),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                final item = cardData[index];
                return ExclusiveCard(
                  bgColor: item['bgColor'],
                  title: item['title'],
                  subtitle: item['subtitle'],
                  buttonText: item['buttonText'],
                  onPressed: () {
                    debugPrint("Tapped: ${item['buttonText']}");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
