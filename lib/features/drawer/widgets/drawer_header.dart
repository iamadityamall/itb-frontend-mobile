import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/common_app_icon.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final String name;
  final String companyLogo;
  final VoidCallback onClose;
  final String userProfilePhoto;

  const DrawerHeaderWidget({
    required this.name,
    required this.companyLogo,
    required this.onClose,
    required this.userProfilePhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1: Logo and Close Button
        Padding(
          padding: AppSizes.drawerPaddingAllSide, // apply padding on all sides
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizes.drawerCompanyLogo,
              GestureDetector(
                onTap: onClose,
                child: CommonAppIcon(icon: Icons.close,color: AppColors.ternary,size: AppSizes.crossIconSize),
              ),
            ],
          ),
        ),
        AppSizes.sizedBoxHeight20,
        // Row 2: Name and Avatar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: AppTextStyles.headingWhite,
            ),
            AppSizes.sizedBoxWidth30,
            AppSizes.drawerUserLogo,
          ],
        ),
        AppSizes.sizedBoxHeight30,
        AppSizes.divider
      ],

    );
  }
}
