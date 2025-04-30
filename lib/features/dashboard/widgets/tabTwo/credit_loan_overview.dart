import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/credit_loan_tab_controller.dart';
import 'RewardPointsSection.dart';
import 'credit_card_view.dart';
import 'loan/active_loan_section.dart';

class CreditLoanOverview extends StatelessWidget {
  CreditLoanOverview({super.key});
  final controller = Get.put(CreditLoanTabController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab("My Credit Cards", 0),
              _buildTab("My Loans", 1),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Tab content
        if (controller.selectedTabIndex.value == 0)
          const CreditCardView()
        else
          const ActiveLoansSection(),

      ],
    ));
  }

  Widget _buildTab(String title, int index) {
    final isSelected = controller.selectedTabIndex.value == index;
    return GestureDetector(
      onTap: () => controller.switchTab(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 3,
              width: 150,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}
