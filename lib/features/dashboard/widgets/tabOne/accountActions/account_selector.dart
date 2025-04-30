import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/transaction_tab_controller.dart';

class AccountSelector extends StatelessWidget {
  const AccountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionTabController>();

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
          color: Colors.grey.shade200,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            value: controller.selectedAccount.value,
            items: [
              DropdownMenuItem(
                value: 'Savings Account 1',
                child: Text(
                  'Savings Account 1',
                    style: AppTextStyles.bodyBlack.copyWith(fontSize: 10),
                ),
              ),
              DropdownMenuItem(
                value: 'Savings Account 2',
                child: Text(
                  'Savings Account 2',
                  style: AppTextStyles.bodyBlack.copyWith(fontSize: 10),
                ),
              ),
            ],
            onChanged: (value) => controller.changeAccount(value!),
          ),
        ),
      ),
    );
  }
}
