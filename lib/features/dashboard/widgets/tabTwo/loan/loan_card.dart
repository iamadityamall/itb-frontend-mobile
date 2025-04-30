import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoanCard extends StatelessWidget {
  final Map<String, String> loan;

  const LoanCard({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${loan['type']} (${loan['status']})",
                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  child: Text("Interest @ ${loan['interestRate']}",style: GoogleFonts.poppins(fontSize: 10)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Amount Info
            _amountRow("Loan Amount", loan['loanAmount']!, Colors.orange),
            _amountRow("Paid", loan['paid']!, Colors.teal),
            _amountRow("Balance", loan['balance']!, Colors.lightBlue),

            const SizedBox(height: 10),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.orange.shade100,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                minHeight: 8,
              ),
            ),

            const SizedBox(height: 16),

            // Interest Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoColumn("Interest Amount", loan['interestAmount']!),
                _infoColumn("Paid", loan['interestPaid']!),
                _infoColumn("Balance", loan['interestBalance']!),
              ],
            ),
            const Divider(height: 24),

            // EMI Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoColumn("Total Tenure EMIs", loan['tenure']!),
                _infoColumn("Paid EMIs", loan['paidEmis']!),
                _infoColumn("Balance EMIs", loan['balanceEmis']!),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoColumn("Monthly EMI", loan['monthlyEmi']!),
                Row(
                  children: [
                    Text("Next EMI due on: ",style: GoogleFonts.poppins(fontSize: 10)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        loan['nextEmiDate']!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 8),
                      ),
                    )
                  ],
                )
              ],
            ),

            const SizedBox(height: 20),

            // Bottom Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:  [
                    Text("Pre Closure Benefits: ",style: GoogleFonts.poppins(fontSize: 10)),
                    SizedBox(width: 10,),
                    Text(
                      "Check Now",
                      style: GoogleFonts.poppins(color: Colors.blue, decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child:  Text("Pay Now",style: GoogleFonts.poppins(fontSize: 10)),
            )
          ],
        ),
      ),
    );
  }

  Widget _amountRow(String label, String value, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        const SizedBox(width: 6),
        Text(
          "$label: $value",
          style: GoogleFonts.poppins(fontSize: 10),
        ),
      ],
    );
  }

  Widget _infoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 10)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
      ],
    );
  }
}
