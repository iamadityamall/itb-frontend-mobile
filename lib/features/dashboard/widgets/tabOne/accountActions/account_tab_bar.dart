import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/transaction_tab_controller.dart';

class AccountTabBar extends StatelessWidget {
  const AccountTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionTabController>();

    final List<_TabData> tabs = const [
      _TabData(icon: Icons.description, label: 'Statement'),
      _TabData(icon: Icons.swap_horiz, label: 'History'),
      _TabData(icon: Icons.send, label: 'Bulk Upload'),
      //_TabData(icon: Icons.receipt_long, label: 'Pay Bills'),
    ];

    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final tab = tabs[index];
          final isSelected = controller.selectedTabIndex.value == index;

          return GestureDetector(
            onTap: () => controller.changeTab(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  tab.icon,
                  color: isSelected ? Colors.teal : Colors.black,
                  size: 20,
                ),
                const SizedBox(height: 4),
                Text(
                  tab.label,
                  style: TextStyle(
                    color: isSelected ? Colors.teal : Colors.black,
                    fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 24,
                    color: Colors.teal,
                  ),
              ],
            ),
          );
        }),
      ),
    ));
  }
}

class _TabData {
  final IconData icon;
  final String label;

  const _TabData({required this.icon, required this.label});
}
