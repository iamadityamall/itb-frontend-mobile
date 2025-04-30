import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NetWorthCard extends StatelessWidget {
  const NetWorthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.secondary, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withOpacity(0.4),
              blurRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Your Net Worth", style: AppTextStyles.extraSmallGreyRegular),
                ],
              ),
              const SizedBox(height: 4),

              // Value & View Link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("₹ 9,31,337.00", style: AppTextStyles.subHeadingBlack),
                  Text("View upcoming income", style: AppTextStyles.extraSmallBlueUnderlineRegular),
                ],
              ),

              const SizedBox(height: 10),
              Divider(color: AppColors.secondary, height: 1.2),
              const SizedBox(height: 20),

              // Grid View of Account Boxes
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.8,
                children: const [
                  _MiniAccountBox(
                    title: "Saving Accounts (2)",
                    subtitle: "Available balance",
                    amount: "₹1,30,837.00",
                    change: "▲ 15%",
                    isPositive: true,
                  ),
                  _MiniAccountBox(
                    title: "Current Accounts (0)",
                    subtitle: "Available balance",
                    amount: "₹00.00",
                  ),
                  _MiniAccountBox(
                    title: "Fixed Deposit (2)",
                    subtitle: "Invested amount",
                    amount: "₹7,00,000.00",
                    change: "Int@ 1%",
                    isPositive: false,
                  ),
                  _MiniAccountBox(
                    title: "Recurring Deposit (1)",
                    subtitle: "Current balance",
                    amount: "₹1,00,500.00",
                    change: "Int@ 1%",
                    isPositive: true,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Bottom link
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "View all accounts",
                  style: AppTextStyles.extraSmallBlueUnderlineRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniAccountBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String? change;
  final bool? isPositive;

  const _MiniAccountBox({
    required this.title,
    required this.subtitle,
    required this.amount,
    this.change,
    this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.ternary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondary, width: 1),
        boxShadow: const [BoxShadow(color: AppColors.secondary, blurRadius: 0.5)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 Prevent overflow
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.extraSmallBlackRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: AppTextStyles.extraSmallBlackRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  amount,
                  style: AppTextStyles.extraSmallBlackBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (change != null)
                Text(
                  change!,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: isPositive == true ? Colors.green : Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}


