import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersTabView extends StatelessWidget {
  const OffersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'title': 'Get 5% discount at Pepperfry',
        'desc':
        'Use promo code: IDBIPEP20 and get 5% discount at Pepperfry with your credit and debit card. Offer valid till 30 Nov 2021',
        'buttonText': 'Shop Now',
        'bgColor': Colors.teal.shade100,
      },
      {
        'title': 'Flat ₹100 off at BigBasket',
        'desc':
        'Use code: IDBIBB100 and get ₹100 off on minimum ₹999 order. Valid till 30 Apr 2025',
        'buttonText': 'Order Now',
        'bgColor': Colors.orange.shade100,
      },
      {
        'title': '20% off on BookMyShow',
        'desc':
        'Pay with IDBI credit card and get 20% off up to ₹150. Valid till 31 May 2025',
        'buttonText': 'Book Now',
        'bgColor': Colors.purple.shade100,
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(offers.length, (index) {
            final offer = offers[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: offer['bgColor'] as Color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer['title']! as String,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    offer['desc']! as String,
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(offer['buttonText']! as String, style: GoogleFonts.poppins(fontSize: 10,color: Colors.white),),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

}
