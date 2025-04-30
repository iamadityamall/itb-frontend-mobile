import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsHandpickedSection extends StatelessWidget {
  const NewsHandpickedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final newsList = [
      {
        'title': 'STOCKS',
        'desc':
        'Lodha Developers stock shows resilience with backing from foreign investors.',
        'btn': 'Buy Now',
        'color': Colors.purple.shade100,
        'icon': Icons.business,
      },
      {
        'title': 'GOLD',
        'desc':
        'Gold prices fell to a 5-month low. Rates down Rs 1,500 this month, good time to go for Gold.',
        'btn': 'Invest Now',
        'color': Colors.amber.shade100,
        'icon': Icons.currency_rupee,
      },
      {
        'title': 'INCOME TAX',
        'desc':
        'As a tax payer, can you claim income tax benefit on home loan and HRA? Can PF balance be checked without UAN?',
        'btn': 'Explore',
        'color': Colors.green.shade100,
        'icon': Icons.account_balance,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "News handpicked for you",
            style:  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...newsList.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 140,
                    decoration: BoxDecoration(
                      color: item['color'] as Color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(item['icon'] as IconData, size: 40),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']! as String,
                            style:  GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['desc']! as String,
                            style:  GoogleFonts.poppins(fontSize: 10),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(item['btn']! as String,style: GoogleFonts.poppins(fontSize: 10, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
