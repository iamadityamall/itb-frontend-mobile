import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialDealsSection extends StatelessWidget {
  const SpecialDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final deals = [
      {
        'title': '15% off',
        'subtitle': 'On your first medicine order',
        'voucher': 'IDML V3456',
        'validTill': '31st May 2021',
        'button': 'Redeem Now',
        'bgColor': Colors.orange,
        'logo': Icons.medical_services, // Placeholder icon
      },
      {
        'title': 'Save ₹100',
        'subtitle': 'On your next redBus ride',
        'voucher': 'IDRS V7860',
        'validTill': '30th May 2021',
        'button': 'Book Now',
        'bgColor': Colors.deepPurple,
        'logo': Icons.directions_bus,
      },
      {
        'title': '₹500 Cashback',
        'subtitle': 'on groceries above ₹5000',
        'voucher': 'IDGC V1234',
        'validTill': '10th June 2021',
        'button': 'Shop Now',
        'bgColor': Colors.green,
        'logo': Icons.shopping_cart,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Text(
            "Special Deals on IDBI Wallet",
            style:  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: deals.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final deal = deals[index];
              return Container(
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Top image area
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                        color: deal['bgColor'] as Color,
                      ),
                      child: Center(
                        child: Icon(
                          deal['logo'] as IconData,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Details area
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            deal['title']! as String,
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(deal['subtitle']! as String, style: GoogleFonts.poppins(fontSize: 10)),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Voucher code",style: GoogleFonts.poppins(fontSize: 10)),
                                  Text(deal['voucher']! as String, style:  GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Valid till",style: GoogleFonts.poppins(fontSize: 10)),
                                  Text(deal['validTill']! as String, style:  GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: deal['bgColor'] as Color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(deal['button']! as String, style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
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
