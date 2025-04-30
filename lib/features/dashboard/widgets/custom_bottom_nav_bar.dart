import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/widgets/common_app_icon.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final VoidCallback onFabTap;

  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onFabTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.account_balance, 'label': 'Banking', 'index': 0},
      {'icon': Icons.account_box, 'label': 'Accounts', 'index': 1},
      {'isSpacer': true},
      {'icon': Icons.chat, 'label': 'Chat', 'index': 3},
      {'icon': Icons.ac_unit, 'label': 'User Profile', 'index': 4},
    ];

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 14,
      color: AppColors.primary,
      child: SizedBox(
        height: 100,
        child: Row(
          children: navItems.map((item) {
            if (item.containsKey('isSpacer')) {
              return const Expanded(child: SizedBox());
            }
            return Expanded(
              child: GestureDetector(
                onTap: () => onTabSelected(item['index']),
                behavior: HitTestBehavior.translucent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonAppIcon(
                      icon: item['icon'],
                      color: selectedIndex == item['index']
                          ? Colors.white
                          : Colors.tealAccent,
                      size: AppSizes.iconSizeLarge,
                    ),
                    Text(
                      item['label'],
                      style: GoogleFonts.poppins(
                        fontSize: AppSizes.extraSmallTextSize,
                        fontWeight: selectedIndex == item['index']
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectedIndex == item['index']
                            ? Colors.white
                            : Colors.tealAccent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
