import 'package:aifinno_atlas_mobile_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/tabOne/AddNewGoalsSection/add_new_goal_section.dart';
import '../widgets/tabOne/SavingsOfferCard/savings_offer_card.dart';
import '../widgets/tabOne/accountActions/account_actions_section.dart';
import '../widgets/tabOne/activeGoals/active_goals_section.dart';
import '../widgets/tabOne/footer/curved_footer_widget.dart';
import '../widgets/tabOne/greeting_header.dart';
import '../widgets/tabOne/net_worth_card.dart';
import '../widgets/tabOne/quickLinks/exclusive_cards_section.dart';
import '../widgets/tabOne/quickLinks/quick_links_section.dart';
import '../widgets/tabOne/taxCard/tax_saving_card.dart';

class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20), // Optional spacing below
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingHeader(),
          NetWorthCard(),
          SizedBox(height: 20),
          AccountActionsSection(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(color: AppColors.primary,height: 0.5),
          ),
          const QuickLinksSection(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(color: AppColors.primary,height: 0.5),
          ),
          SizedBox(height: 20),
          const ExclusiveCardsSection(),
          SizedBox(height: 40),
          TaxSavingsCard(),
          SizedBox(height: 40),
          ActiveGoalsSection(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(color: AppColors.primary,height: 0.5),
          ),
          SizedBox(height: 40),
          AddNewGoalsSection(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(color: AppColors.primary,height: 0.5),
          ),
          SizedBox(height: 40),
          SavingsOfferCard(),
          const CurvedFooterWidget(),
        ],
      ),
    );
  }
}
