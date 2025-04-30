import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavingsOfferCard extends StatelessWidget {
  const SavingsOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'title': 'Biggest Grocery Sale. Get cash back of',
        'amount': '₹200',
        'details': 'Cashback on all purchase above ₹5000',
        'button': 'Buy Now',
        'bgColor': Colors.orange,
      },
      {
        'title': 'Travel Bonanza. Earn cash back up to',
        'amount': '₹500',
        'details': 'On all bookings above ₹10,000',
        'button': 'Book Now',
        'bgColor': Colors.deepPurple,
      },
      {
        'title': 'Dining Deals. Save instantly with',
        'amount': '₹300',
        'details': 'on weekend dining across select partners',
        'button': 'Dine Now',
        'bgColor': Colors.teal,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Maximise your savings",
            style: GoogleFonts.poppins(color: AppColors.textGrey,fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: offers.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final offer = offers[index];
              return Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // 🧡 Top Color Section
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: offer['bgColor'] as Color,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      child:  Center(
                        child: Text(
                          "GROFERS",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // 📝 Offer Content
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer['title'] as String,
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              text: "${offer['amount']}\n",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: offer['details'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(offer['button'] as String, style: GoogleFonts.poppins(
                                color: AppColors.textWhite,
                                fontSize: 10
                              ),),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
