import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quick_link_tile.dart';

class QuickLinksSection extends StatelessWidget {
  const QuickLinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> links = [
      {
        'icon': Icons.money_outlined,
        'title': 'Cardless Cash Withdrawl',
        'subtitle': 'You can withdraw with transaction limit of 50,000',
        'showInfo': true,
      },
      {
        'icon': Icons.cached,
        'title': 'Recurring payments',
        'subtitle': 'View or add your list of regular payees',
      },
      {
        'icon': Icons.edit_document,
        'title': 'Request Cheque Book',
        'subtitle': 'Last issued on 21 Apr 2021 with 30 leaves',
        'showInfo': true,
      },
      {
        'icon': Icons.verified_user_outlined,
        'title': 'Activate NACH/ECS & e-Mandate',
        'subtitle': 'Automate your recurring payments',
      },
      {
        'icon': Icons.check_circle_outline,
        'title': 'Standing Instructions',
        'subtitle': 'View your standing instructions',
      },
      {
        'icon': Icons.lock_outline,
        'title': 'Open Fixed Deposit',
        'subtitle': 'You have attractive interest rates starting 4%',
      },
      {
        'icon': Icons.savings_outlined,
        'title': 'Open Recurring Deposit',
        'subtitle': 'Avail attractive rates for your goals',
      },
      {
        'icon': Icons.notifications_active_outlined,
        'title': 'Manage Alerts',
        'subtitle': 'Organise your notifications',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Links",
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.textGrey),
          ),
          const SizedBox(height: 12),
          ...links.map((link) => QuickLinkTile(
            icon: link['icon'],
            title: link['title'],
            subtitle: link['subtitle'],
            showInfoIcon: link['showInfo'] ?? false,
          )),
        ],
      ),
    );
  }
}
