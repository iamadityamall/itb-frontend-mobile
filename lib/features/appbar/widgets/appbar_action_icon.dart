import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/widgets/common_app_icon.dart';
import 'package:aifinno_atlas_mobile_app/core/widgets/comon_app_icon_button.dart';
import 'package:flutter/material.dart';

class AppBarActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AppBarActionIcon({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonAppIconButton(
      icon: CommonAppIcon(
        icon: icon,
        color: AppColors.textBlack,
        size: AppSizes.crossIconSize,
      ),
      onPressed: onPressed,
    );
  }
}
