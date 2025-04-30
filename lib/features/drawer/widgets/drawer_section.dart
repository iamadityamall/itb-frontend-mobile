import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:aifinno_atlas_mobile_app/core/widgets/common_app_icon.dart';
import 'package:flutter/material.dart';
import 'drawer_title.dart';

class DrawerSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> children;
  final Function(String) onChildTap;

  const DrawerSection({
    required this.title,
    required this.icon,
    required this.children,
    required this.onChildTap,
    super.key,
  });

  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CommonAppIcon(
            icon: widget.icon,
            color: AppColors.ternary,
            size: AppSizes.crossIconSize,
          ),
          title: Text(widget.title, style: AppTextStyles.subHeadingWhite),
          trailing: CommonAppIcon(
            icon:
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
            color: AppColors.ternary,
            size: AppSizes.crossIconSize,
          ),
          onTap: () => setState(() => isExpanded = !isExpanded),
        ),
        if (isExpanded)
          ...widget.children.map(
            (child) =>
                DrawerTile(title: child, onTap: () => widget.onChildTap(child)),
          ),
        AppSizes.divider,
      ],
    );
  }
}
