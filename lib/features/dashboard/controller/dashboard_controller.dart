import 'package:aifinno_atlas_mobile_app/core/constants/app_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final _storage = GetStorage();
  final _tabKey = 'selectedTabIndex';

  var selectedIndex = 0.obs;

  @override
  void onInit(){
    selectedIndex.value = _storage.read(_tabKey) ?? 0;
    super.onInit();
  }

  void changeTab(int index){
    selectedIndex.value = index;
    _storage.write(_tabKey, index);
  }

  var selectedTabIndex = 0.obs;
  var selectedMonthIndex = 0.obs;
  var selectedAccount = 'Savings Account 1'.obs;

  void changeAccount(String account) {
    selectedAccount.value = account;
  }
}


