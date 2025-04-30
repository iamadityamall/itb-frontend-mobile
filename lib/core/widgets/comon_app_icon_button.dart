import 'package:aifinno_atlas_mobile_app/core/widgets/common_app_icon.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CommonAppIconButton extends StatelessWidget {
  final CommonAppIcon icon;
  final double iconSize;
  final Color iconColor;
  final VoidCallback onPressed;
  final String? tooltip;

  const CommonAppIconButton({
    required this.icon,
    required this.onPressed,
    this.iconSize = 20.0,
    this.iconColor = AppColors.textBlack,
    this.tooltip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }
}
