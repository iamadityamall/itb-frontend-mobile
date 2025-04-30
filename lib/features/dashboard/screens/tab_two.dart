import 'package:flutter/material.dart';
import 'package:aifinno_atlas_mobile_app/features/dashboard/widgets/tabTwo/credit_loan_overview.dart';

import '../widgets/tabTwo/RewardPointsSection.dart';
import '../widgets/tabTwo/loan/active_loan_section.dart';
// Add more imports here as you create more widgets

class TabTwo extends StatelessWidget {
  const TabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreditLoanOverview(),
        ],
      ),
    );
  }
}
