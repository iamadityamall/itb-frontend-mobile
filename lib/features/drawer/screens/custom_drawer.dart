import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import '../models/drawer_sections_data.dart';
import '../widgets/drawer_header.dart';
import '../widgets/drawer_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void handleChildTap(String title) {
    debugPrint("Tapped on: $title");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.75), // darkens background
      body: Row(
        children: [
          Expanded(
            flex: 80,
            child: Container(
              color: AppColors.primary,
              child: SafeArea(
                child: Column(
                  children: [
                    DrawerHeaderWidget(
                      name: "Ashish Malhotra",
                      companyLogo: 'assets/images/company-logo.png',
                      userProfilePhoto: "assets/images/user-logo.jpg",
                      onClose: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: drawerSections.length,
                        itemBuilder: (context, index) {
                          final section = drawerSections[index];
                          return DrawerSection(
                            title: section.title,
                            icon: section.icon,
                            children: section.children,
                            onChildTap: handleChildTap,
                          );
                        },
                      ),
                    ),
                    AppSizes.sizedBoxHeight20
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
