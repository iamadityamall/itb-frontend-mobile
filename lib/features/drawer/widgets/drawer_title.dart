import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerTile({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      horizontalTitleGap: 0,
      leading: Text("→  ", style: AppTextStyles.bodyWhite),
      title: Text(title, style: AppTextStyles.bodyWhite),
      onTap: onTap,
    );
  }
}
