import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatsNewTodayWidget extends StatelessWidget {
  final String userName;

  const WhatsNewTodayWidget({super.key, this.userName = "Ashish"});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'title': 'Get\n5% Cashback',
        'subtitle': 'on your next iced coffee.',
        'details': 'Pay using IDBI debit card\n& save upto ₹100',
        'color': Colors.brown.shade200,
      },
      {
        'title': '2 Free\nMovie Tickets',
        'subtitle': 'on your anniversary!',
        'details': 'Just flash your IDBI card\nat the counter.',
        'color': Colors.deepPurple.shade200,
      },
      {
        'title': '3 Save\n20% Flat',
        'subtitle': 'on today\'s order!',
        'details': 'Pay Through IDBI wallet.',
        'color': Colors.red.shade200,
      },
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFDE5D9C), Color(0xFFFA9DA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi $userName',
                    style:  GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "What's New Today",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              Text(
                '19 Apr 2021\nHappy Monday',
                textAlign: TextAlign.right,
                style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.8), fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Container(
                  width: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: offer['color'] as Color,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer['title']! as String,
                        style:  GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        offer['subtitle']! as String,
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                      ),
                      const Spacer(),
                      Text(
                        offer['details']! as String,
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
