import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/common_button.dart';

void showLogoutDialog() {
  Get.defaultDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    title: '',
    content: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //🏦 Bank Logo
        Image.asset(
          AppStrings.companyFullLogo,
          width: AppSizes.appbarCompanyFullLogoWidth,
          fit: BoxFit.contain,
        ),
        AppSizes.sizedBoxHeight10,
        // Divider
        AppSizes.dividerTwo,
        AppSizes.sizedBoxHeight10,
        // Logout Message
        Text(
          AppStrings.appBarLogoutDialogText,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyBlack,
        ),
        AppSizes.sizedBoxHeight10,
        // Buttons
        Row(
          children: [
            Expanded(
              child: CommonButton(
                text: AppStrings.logoutCancelText,
                isPrimary: false,
                onPressed: () => Get.back(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CommonButton(
                text: AppStrings.logoutLogoutText,
                isPrimary: true,
                onPressed: () {
                  Get.back(); // Close dialog
                  Get.offAllNamed('/mpin-login'); // Navigate to login
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
