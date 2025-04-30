import 'package:aifinno_atlas_mobile_app/features/dashboard/widgets/tabTwo/loan/AbstractFooter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RewardPointsSection.dart';

class CreditCardView extends StatelessWidget {
  const CreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      {
        'name': 'Ashish Malhotra',
        'last4': '3456',
        'unbilled': '₹10,600.00',
        'limit': '₹39,400',
        'points': '50,400',
        'billDate': '30 April',
        'payBy': '15 May',
      },
      {
        'name': 'Aditya Kumar',
        'last4': '7890',
        'unbilled': '₹5,200.00',
        'limit': '₹25,000',
        'points': '12,000',
        'billDate': '10 May',
        'payBy': '25 May',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'Active Cards',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Swipable cards
        SizedBox(
          height: 460,
          child: PageView.builder(
            itemCount: cards.length,
            controller: PageController(viewportFraction: 0.95),
            itemBuilder: (context, index) {
              final card = cards[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CreditCardWidget(card: card),
              );
            },
          ),
        ),
        const Divider(color: Colors.orangeAccent),
        SizedBox(height: 20),
        RewardPointsSection(),
        SizedBox(height: 40),
        AbstractFooter(),
      ],
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final Map<String, String> card;

  const CreditCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card UI
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFFFF6A00), Color(0xFF9B26AF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Visa Gold", style: TextStyle(color: Colors.white, fontSize: 10)),
              const SizedBox(height: 16),
              Text(
                "Credit Card Number",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                "1302 XXXX XXXX ${card['last4']}",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const Spacer(),
              Text(
                card['name'] ?? '',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Credit Limit Progress
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Available Credit limit",
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: 0.8,
                backgroundColor: Colors.grey.shade300,
                color: Colors.teal,
                minHeight: 8,
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: Text(card['limit'] ?? '',style: GoogleFonts.poppins(fontSize: 10)),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Details
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Total unbilled", card['unbilled'] ?? ''),
              _infoColumn("Total reward points", card['points'] ?? ''),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Next bill date", card['billDate'] ?? ''),
              _infoColumn("Pay by date", card['payBy'] ?? ''),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _outlineButton("Statement"),
            _outlineButton("Pay now"),
            _outlineButton("Manage"),
          ],
        ),
      ],
    );
  }

  Widget _infoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 10)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
      ],
    );
  }

  Widget _outlineButton(String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(label, style: GoogleFonts.poppins(fontSize: 10)),
    );
  }
}
