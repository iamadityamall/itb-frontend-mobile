import 'package:get/get.dart';

class CreditLoanTabController extends GetxController {
  var selectedTabIndex = 0.obs;

  void switchTab(int index) => selectedTabIndex.value = index;
}
