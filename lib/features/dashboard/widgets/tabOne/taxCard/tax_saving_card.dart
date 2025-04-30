import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class TaxSavingsCard extends StatelessWidget {
  const TaxSavingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE0B2), Color(0xFFFFF3E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(1),
            blurRadius: 0,
            offset: const Offset(0,0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balance your gains & save tax",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height:40),
          SizedBox(
            height: 140,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const labels = [
                          'A',
                          'M',
                          'J',
                          'Ju',
                          'A',
                          'S',
                          'O',
                          'N',
                          'D',
                          'J',
                          'F',
                          'M',
                        ];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            labels[value.toInt() % labels.length],
                            style: GoogleFonts.poppins(fontSize: 8),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt() % 3 == 0 ? '${value.toInt()}K' : '',
                          style: GoogleFonts.poppins(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    spots: const [
                      FlSpot(0, 6),
                      FlSpot(1, 7),
                      FlSpot(2, 10),
                      FlSpot(3, 6),
                      FlSpot(4, 8),
                      FlSpot(5, 5),
                      FlSpot(6, 5),
                      FlSpot(7, 4),
                      FlSpot(8, 9),
                      FlSpot(9, 9.5),
                      FlSpot(10, 10),
                      FlSpot(11, 6),
                    ],
                    dotData: FlDotData(show: true),
                    color: Colors.teal,
                    barWidth: 2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Save 5% tax*",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "As your PPF annual contribution is just short by ₹10K for this financial year. Hence, we recommend you to transfer that amount to your PPF account & save tax.",
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Transfer Now",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                ),
              ),
              const SizedBox(height:5),
              Text(
                "*Eligible for tax deductions u/s 80C",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
