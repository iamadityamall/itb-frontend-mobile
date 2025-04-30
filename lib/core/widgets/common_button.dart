import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const CommonButton({
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isPrimary
        ? ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: AppColors.secondary),
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.ternary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
            ),
          ),
          child: Text(text, style: AppTextStyles.bodyWhite,),
        )
        : OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.ternary,
            side: const BorderSide(color: AppColors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
            ),
          ),
          child: Text(text, style: AppTextStyles.bodyBlack,),
        );
  }
}
