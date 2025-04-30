import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_strings.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.ternary, AppColors.ternary], // light mint background
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 👋 Greeting & Timestamp
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizes.sizedBoxHeight10,
                Text(
                  "Hello, Ashish",
                  style: AppTextStyles.subHeadingBlack,
                ),
                const SizedBox(height: 4),
                Text(
                  "Last Logged on 2025-04-06 11:38:40.0",
                  style: AppTextStyles.bodyBlack,
                ),
                AppSizes.sizedBoxHeight10,
              ],
            ),
          ),

          // 🧑 Profile + Camera overlay
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary,
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  radius: AppSizes.iconSizeMedium,
                  backgroundImage: AssetImage(AppStrings.userLogo),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.camera_alt, color: AppColors.secondary, size: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
