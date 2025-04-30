import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';



class LoanCalculatorWidget extends StatefulWidget {
  const LoanCalculatorWidget({super.key});

  @override
  State<LoanCalculatorWidget> createState() => _LoanCalculatorWidgetState();
}

class _LoanCalculatorWidgetState extends State<LoanCalculatorWidget> {
  final currencyFormatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  String selectedLoanType = 'Personal Loan';
  double loanAmount = 100000;
  int loanPeriod = 2; // in years
  double interestRate = 12.0;

  double calculateEMI(double principal, double annualRate, int years) {
    double monthlyRate = annualRate / (12 * 100);
    int months = years * 12;
    return (principal * monthlyRate * pow(1 + monthlyRate, months)) /
        (pow(1 + monthlyRate, months) - 1);
  }

  @override
  Widget build(BuildContext context) {
    double monthlyEMI = calculateEMI(loanAmount, interestRate, loanPeriod);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Loan Calculator", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 20),

          // Dropdown
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(24),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedLoanType,
                items: [
                  'Personal Loan',
                  'Home Loan',
                  'Education Loan',
                  'Vehicle Loan'
                ].map((type) => DropdownMenuItem(value: type, child: Text(type, style: GoogleFonts.poppins(fontSize: 10),))).toList(),
                onChanged: (value) => setState(() => selectedLoanType = value!),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Loan Amount
          _buildSliderLabel("Loan Amount", currencyFormatter.format(loanAmount)),
          Slider(
            min: 50000,
            max: 1000000,
            divisions: 19,
            value: loanAmount,
            activeColor: Colors.teal,
            inactiveColor: Colors.grey.shade300,
            onChanged: (value) => setState(() => loanAmount = value),
          ),

          // Loan Period
          _buildSliderLabel("Loan Period", "$loanPeriod Year"),
          Slider(
            min: 1,
            max: 6,
            divisions: 5,
            value: loanPeriod.toDouble(),
            activeColor: Colors.teal,
            inactiveColor: Colors.grey.shade300,
            onChanged: (value) => setState(() => loanPeriod = value.round()),
          ),

          // Interest Rate
          _buildSliderLabel("Interest Rate", "${interestRate.toStringAsFixed(1)}%"),
          Slider(
            min: 10.5,
            max: 19,
            divisions: 17,
            value: interestRate,
            activeColor: Colors.teal,
            inactiveColor: Colors.grey.shade300,
            onChanged: (value) => setState(() => interestRate = value),
          ),

          const SizedBox(height: 24),

          // EMI Display
          Row(
            children: [
              Text("Monthly Loan EMI", style: GoogleFonts.poppins(fontWeight: FontWeight.normal)),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  currencyFormatter.format(monthlyEMI),
                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSliderLabel(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 10)),
          ),
        ],
      ),
    );
  }
}
