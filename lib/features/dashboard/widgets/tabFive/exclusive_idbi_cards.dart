import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExclusiveIDBICards extends StatelessWidget {
  const ExclusiveIDBICards({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "Buy your Fastag with IDBI Bank, online",
        "cashback": "₹75",
        "condition": "Cashback on all recharges above ₹500",
        "color": Colors.teal.shade100,
      },
      {
        "title": "Open FD online with IDBI Bank",
        "cashback": "₹150",
        "condition": "Extra cashback on FD above ₹10K",
        "color": Colors.orange.shade100,
      },
      {
        "title": "Pay bills using IDBI NetBanking",
        "cashback": "₹100",
        "condition": "Applicable on min ₹1000 transaction",
        "color": Colors.purple.shade100,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            "Exclusive from IDBI",
            style:  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner placeholder
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                        color: item['color'] as Color,
                      ),
                      child: const Center(
                        child: Icon(Icons.local_offer, size: 40, color: Colors.black45),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']! as String,
                            style:  GoogleFonts.poppins(fontSize: 10),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['cashback']! as String,
                            style:  GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['condition']! as String,
                            style:  GoogleFonts.poppins(color: Colors.black54, fontSize: 10),
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
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                              ),
                              child:  Text("Buy Now", style: GoogleFonts.poppins(fontSize: 10, color: Colors.white)),
                            ),
                          )
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
