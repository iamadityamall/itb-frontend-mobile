import 'package:get/get.dart';

class TransactionTabController extends GetxController {
  var selectedTabIndex = 0.obs;
  var selectedAccount = 'Savings Account 1'.obs;
  var selectedMonthIndex = 0.obs;


  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void changeAccount(String account) {
    selectedAccount.value = account;
  }
}
