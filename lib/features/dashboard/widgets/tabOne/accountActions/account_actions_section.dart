import 'package:aifinno_atlas_mobile_app/features/dashboard/widgets/tabOne/accountActions/pay_bills_tab_view.dart';
import 'package:aifinno_atlas_mobile_app/features/dashboard/widgets/tabOne/accountActions/transfer_tab_view.dart';
import 'package:aifinno_atlas_mobile_app/features/dashboard/widgets/tabOne/accountActions/upi_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/transaction_tab_controller.dart';
import 'StatementDownloadWidget.dart';
import 'account_selector.dart';
import 'account_tab_bar.dart';
import 'bulk_upload_widget.dart';
import 'download_button.dart';
import 'recent_transactions_list.dart';
import 'transaction_month_selector.dart';

class AccountActionsSection extends StatelessWidget {
  final controller = Get.put(TransactionTabController());

  AccountActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔽 Top Row: Account dropdown + Download Button only in Statement Tab
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  AccountSelector(),
                  SizedBox(width: 16),
                  // if (controller.selectedTabIndex.value == 0)
                  //   DownloadStatementButton(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 Tab Bar
            const AccountTabBar(),

            const SizedBox(height: 10),

            // 🔁 Tab Content View
            IndexedStack(
              index: controller.selectedTabIndex.value,
              children: [
                StatementDownloadWidget(),
                //RecentTransactionsList(),
                // Tab 0 - Statement
                TransferTabView(),
                BulkUploadWidget(),
                // Tab 1 - Transfer
                UpiTabView(), // Tab 2
                PayBillsTabView(),  // Tab 3
              ],
            ),
            // 🗓️ Month Selector only in Statement tab
            // if (controller.selectedTabIndex.value == 0)
            //   const TransactionMonthSelector(),
          ],
        ),
      ),
    );
  }
}
