import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveGoalsSection extends StatelessWidget {
  const ActiveGoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = [
      {
        "title": "Europe Tour",
        "saved": "₹2,85,000",
        "target": "₹5,00,000",
        "completedPercent": 0.57,
        "daysToReach": 100,
        "color": Colors.teal.shade700,
      },
      {
        "title": "New Car",
        "saved": "₹1,50,000",
        "target": "₹4,00,000",
        "completedPercent": 0.375,
        "daysToReach": 120,
        "color": Colors.deepPurple.shade700,
      },
      {
        "title": "Home Downpayment",
        "saved": "₹6,00,000",
        "target": "₹10,00,000",
        "completedPercent": 0.6,
        "daysToReach": 200,
        "color": Colors.indigo.shade800,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Your active goals",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.textGrey,
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: goals.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final goal = goals[index];
              return Container(
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: goal['color'] as Color,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          goal['title']! as String,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "You have to save",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              goal['target']! as String,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Saved Amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You've saved",
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          goal['saved']! as String,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: goal['completedPercent'] as double,
                        minHeight: 10,
                        backgroundColor: Colors.white24,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orangeAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${((goal['completedPercent'] as double) * 100).round()}% Completed\n${goal['daysToReach']} Days to reach",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:Text("Topup Now", style: GoogleFonts.poppins(
                            color: AppColors.textWhite,
                            fontSize: 10
                          ),),
                        ),
                      ],
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
