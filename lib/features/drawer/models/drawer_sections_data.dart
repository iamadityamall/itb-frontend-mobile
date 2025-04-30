import 'package:flutter/material.dart';
import 'drawer_section_model.dart';

const List<DrawerSectionModel> drawerSections = [
  DrawerSectionModel(
    title: "Pay",
    icon: Icons.attach_money,
    children: [
      "UPI Payment",
      "Money Transfer",
      "Credit Cards Payment",
      "Recharge",
      "Bill Pay",
    ],
  ),
  DrawerSectionModel(
    title: "INVEST",
    icon: Icons.savings,
    children: [
      "Demat",
      "Mutual Fund",
      "Term Insurance",
    ],
  ),
  DrawerSectionModel(
    title: "BORROW",
    icon: Icons.account_balance_wallet,
    children: [
      "Personal Loan",
      "Gold Loan",
      "Two Wheeler Loan",
      "Home Loan",
      "Loan Against Mutual Funds",
    ],
  ),
  DrawerSectionModel(
    title: "YOUR PROFILE",
    icon: Icons.security,
    children: [
      "Personal Profile",
      "Beneficiary List",
      "Manage Alerts",
      "Tax & Filings",
      "Security Center",
      "Feedback",
      "Contact Us",
      "FAQs",
    ],
  ),
];
