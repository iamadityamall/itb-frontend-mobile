import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class DownloadStatementButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DownloadStatementButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          onPressed ??
          () {
            // TODO: Implement logic
            debugPrint("Download Statement Pressed");
          },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // 👈 pill shape
        ),
        elevation: 2,
      ),
      child: Text(
        'Download Statement',
        style: AppTextStyles.bodyWhite.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 10,
        ),
      ),
    );
  }
}
