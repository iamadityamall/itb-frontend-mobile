import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CommonAppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;

  const CommonAppIcon({
    required this.icon,
    this.size = 20.0,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color ?? AppColors.ternary,
    );
  }
}
