import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_strings.dart';
import 'package:aifinno_atlas_mobile_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppSizes {
  static const double padding = 16.0;
  static const double margin = 16.0;
  static const double borderRadius = 10.0;
  static const double drawerUserProfilePhotoRadius = 20.0;
  static const double drawerCompanyLogoRadius = 15.0;

  static const double appbarHeight = 56.0;
  static const  double appbarCompanyFullLogoWidth = 70.0;

  static const double height10 = 10;
  static const double height20 = 20;
  static const double height30 = 30;
  static const double height40 = 40;

  static const double width10 = 10;
  static const double width20 = 20;
  static const double width30 = 30;
  static const double width40 = 40;

  static const double headingTextSize = 20.0;
  static const double extraSmallTextSize = 10.0;

  static const double buttonBorderRadius = 8;

  static const double drawerDividerHeight = 0.5;

  static const double bottomNavbarHeight = 54.0;

  // Spacers
  static const sizedBoxHeight10 = SizedBox(
    height: height10,
  );
  static const sizedBoxHeight20 = SizedBox(
    height: height20,
  );
  static const sizedBoxHeight30 = SizedBox(
    height: height30,
  );
  static const sizedBoxHeight40 = SizedBox(
    height: height40,
  );

  static const sizedBoxWidth10 = SizedBox(
    width: width10,
  );
  static const sizedBoxWidth20 = SizedBox(
    width: width20,
  );
  static const sizedBoxWidth30 = SizedBox(
    width: width30,
  );
  static const sizedBoxWidth40 = SizedBox(
    width: width40,
  );

  // Dividers
  static const divider = Divider(
    color: AppColors.ternary,
    height: drawerDividerHeight,
  );


  static const dividerTwo = Divider(
    color: Colors.black45,
    height: drawerDividerHeight,
  );

  static const appbarLogoutDialogueBoxDivider = Divider(
    color: Colors.white70,
    height: drawerDividerHeight,
  );


  static const drawerCompanyLogo = CircleAvatar(
    backgroundImage: AssetImage(AppStrings.companyLogo),
    radius: drawerCompanyLogoRadius,
  );

  static const drawerUserLogo = CircleAvatar(
    backgroundImage: AssetImage(AppStrings.userLogo),
    radius: drawerUserProfilePhotoRadius,
  );

  static const drawerPaddingAllSide = EdgeInsets.all(16);

  static const crossIconSize = 22.0;
  static const iconSizeLarge = 20.0;
  static const iconSizeMedium = 18.0;
  static const iconSizeSmall = 16.0;

  static const floatingActionButtonHeight = 60.0;
  static const floatingActionButtonWidth = 60.0;
}
