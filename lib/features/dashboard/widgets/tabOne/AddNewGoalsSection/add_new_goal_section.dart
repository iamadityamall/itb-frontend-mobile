import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewGoalsSection extends StatelessWidget {
  const AddNewGoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> goals = [
      {'title': 'Higher Studies', 'color': Colors.brown.shade300},
      {'title': 'Retirement', 'color': Colors.blueGrey.shade200},
      {'title': 'Marriage', 'color': Colors.redAccent.shade100},
      {'title': 'Customize', 'color': Colors.cyan.shade200},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Add new life goals',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.textGrey
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: goals.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final goal = goals[index];
              return Container(
                decoration: BoxDecoration(
                  color: goal['color'],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      top: 45,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add, size: 30, color: Colors.black),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Text(
                        goal['title'],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
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
