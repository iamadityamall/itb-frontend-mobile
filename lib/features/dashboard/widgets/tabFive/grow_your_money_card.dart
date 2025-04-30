import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrowYourMoneySection extends StatelessWidget {
  const GrowYourMoneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final ipoList = [
      {
        "company": "Macro Developers Pvt. Ltd.",
        "issueDate": "07-09 May 2021",
        "priceBand": "₹483 - ₹486",
        "lotSize": "30 Shares",
      },
      {
        "company": "TechVentures India Ltd.",
        "issueDate": "15-17 May 2021",
        "priceBand": "₹220 - ₹225",
        "lotSize": "45 Shares",
      },
      {
        "company": "Realty Assets Corp.",
        "issueDate": "21-24 May 2021",
        "priceBand": "₹600 - ₹615",
        "lotSize": "20 Shares",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Grow your money",
              style:  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 420,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: ipoList.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final ipo = ipoList[index];
                return _GrowYourMoneyCard(
                  company: ipo['company']!,
                  issueDate: ipo['issueDate']!,
                  priceBand: ipo['priceBand']!,
                  lotSize: ipo['lotSize']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GrowYourMoneyCard extends StatelessWidget {
  final String company;
  final String issueDate;
  final String priceBand;
  final String lotSize;

  const _GrowYourMoneyCard({
    required this.company,
    required this.issueDate,
    required this.priceBand,
    required this.lotSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📷 Placeholder for image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(Icons.apartment, size: 50, color: Colors.grey),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company, style:  GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12)),
                const SizedBox(height: 12),
                 Text("IPO is Live now",
                    style:  GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Issue date: $issueDate",style: GoogleFonts.poppins(fontSize: 10)),
                    Text("Price band:\n$priceBand",style: GoogleFonts.poppins(fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 8),
                Text("Lot size:\n$lotSize",style: GoogleFonts.poppins(fontSize: 10)),
                const SizedBox(height: 12),
                const Divider(),
                 Text("Strengths", style:  GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
                 Text("• Premium properties, engaged users",style: GoogleFonts.poppins(fontSize: 10)),
                const SizedBox(height: 6),
                Text("Risks", style:  GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
                Text("• Market competition, customer needs",style: GoogleFonts.poppins(fontSize: 10)),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child:  Text("Book Now",style: GoogleFonts.poppins(fontSize: 10, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
