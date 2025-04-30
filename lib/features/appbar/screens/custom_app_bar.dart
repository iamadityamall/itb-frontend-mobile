import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar_action_icon.dart';
import '../widgets/logout_dialog.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuTap;

  const CustomAppBar({required this.onMenuTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: onMenuTap,
      ),
      title: Row(
        children: [
          Image.asset(
            AppStrings.companyFullLogo,
            width: AppSizes.appbarCompanyFullLogoWidth,
          ),
        ],
      ),
      actions: const [
        AppBarActionIcon(icon: Icons.search, onPressed: _onSearch),
        AppBarActionIcon(
          icon: Icons.color_lens_outlined,
          onPressed: _onThemeToggle,
        ),
        AppBarActionIcon(icon: Icons.help_outline, onPressed: _onHelp),
        AppBarActionIcon(icon: Icons.power_settings_new, onPressed: _onLogout),
      ],
    );
  }

  static void _onSearch() {
    // TODO: Handle search
  }

  static void _onThemeToggle() {
    // TODO: Handle theme toggle
  }

  static void _onHelp() {
    // TODO: Help or FAQ
  }

  static void _onLogout() {
    showLogoutDialog(); // From logout_dialog.dart
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appbarHeight);
}
