import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../appbar/screens/custom_app_bar.dart';
import '../../drawer/screens/custom_drawer.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'tab_one.dart';
import 'tab_two.dart';
import 'tab_four.dart';
import 'tab_five.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _tabs = [
    TabOne(),
    TabTwo(),
    Container(), // Placeholder for FAB tab to avoid changing index
    TabFour(),
    TabFive(),
  ];

  void _showTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => const _TaskBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: const CustomDrawer(),
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: _tabs,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: AppSizes.floatingActionButtonWidth,
          height: AppSizes.floatingActionButtonHeight,
          child: FloatingActionButton(
            backgroundColor: AppColors.secondary,
            elevation: 4,
            shape: const CircleBorder(),
            onPressed: () => _showTaskBottomSheet(context),
            child: const Icon(Icons.add, size: 32),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: controller.selectedIndex.value,
          onTabSelected: controller.changeTab,
          onFabTap: () => _showTaskBottomSheet(context),
        ),
      ),
    );
  }
}

class _TaskBottomSheet extends StatelessWidget {
  const _TaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            gradient: LinearGradient(
              colors: [AppColors.secondary, Color(0xFFFFA500)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            controller: controller,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'My frequent tasks',
                    style:  GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
              const Divider(color: Colors.white70),
              _taskItem(Icons.payments, 'Transfer Money'),
              _taskItem(Icons.person_add_alt_1, 'Add Beneficiary'),
              _taskItem(Icons.receipt_long, 'Pay Bills'),
              _taskItem(Icons.electric_car, 'Recharge FasTag'),
              _taskItem(Icons.account_balance, 'Open an Account'),
            ],
          ),
        );
      },
    );
  }

  Widget _taskItem(IconData icon, String label) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(label, style:  GoogleFonts.poppins(color: Colors.white, fontSize: 10)),
          ],
        ),
        const Divider(color: Colors.white70),
      ],
    );
  }
}
