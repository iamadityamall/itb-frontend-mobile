import 'package:aifinno_atlas_mobile_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AbstractFooter.dart';
import 'EducationLoanSuggestionCard.dart';
import 'HassleFreeLoansGrid.dart';
import 'LoanCalculatorWidget.dart';
import 'loan_card.dart';

class ActiveLoansSection extends StatelessWidget {
  const ActiveLoansSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loans = [
      {
        'type': 'Personal Loan',
        'status': 'Active',
        'loanAmount': '₹1,50,000.00',
        'paid': '₹40,000.00',
        'balance': '₹1,10,000.00',
        'interestRate': '11%',
        'interestAmount': '₹44,496.00',
        'interestPaid': '₹22,000.00',
        'interestBalance': '₹28,000.00',
        'tenure': '2 Years (24 Months)',
        'paidEmis': '5',
        'balanceEmis': '10',
        'monthlyEmi': '₹2007.00',
        'nextEmiDate': '25 May 21',
      },
      {
        'type': 'Car Loan',
        'status': 'Active',
        'loanAmount': '₹4,00,000.00',
        'paid': '₹1,20,000.00',
        'balance': '₹2,80,000.00',
        'interestRate': '10%',
        'interestAmount': '₹65,000.00',
        'interestPaid': '₹30,000.00',
        'interestBalance': '₹35,000.00',
        'tenure': '3 Years (36 Months)',
        'paidEmis': '10',
        'balanceEmis': '26',
        'monthlyEmi': '₹3200.00',
        'nextEmiDate': '10 June 21',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Active Loans",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textBlack),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 380,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.95),
            itemCount: loans.length,
            itemBuilder: (context, index) {
              final loan = loans[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LoanCard(loan: loan),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        const HassleFreeLoansGrid(),
        const SizedBox(height: 20),
        LoanCalculatorWidget(),
        const SizedBox(height: 20),
        EducationLoanSuggestionCard(),
        SizedBox(height: 24),
        AbstractFooter(),
      ],
    );
  }
}
