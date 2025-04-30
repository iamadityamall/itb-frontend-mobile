import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/transaction_tab_controller.dart';

class TransactionMonthSelector extends StatelessWidget {
  const TransactionMonthSelector({super.key});

  static const List<String> months = [
    "Apr", "Mar", "Feb", "Jan", "Dec", "Nov", "Oct"
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionTabController>();

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: months.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedMonthIndex.value == index;

            return GestureDetector(
              onTap: () => controller.selectedMonthIndex.value = index,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.teal : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.teal : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  months[index],
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
