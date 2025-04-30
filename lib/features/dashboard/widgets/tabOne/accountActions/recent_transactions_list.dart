import 'package:flutter/material.dart';

class RecentTransactionsList extends StatelessWidget {
  const RecentTransactionsList({super.key});

  final List<Map<String, dynamic>> _transactions = const [
    {
      'icon': Icons.lightbulb_outline,
      'title': 'Electricity Bill',
      'subtitle': 'Txn ID: 12345678',
      'amount': '- ₹1,200.00',
      'isDebit': true,
    },
    {
      'icon': Icons.local_taxi,
      'title': 'Uber Ride',
      'subtitle': 'Txn ID: 98765432',
      'amount': '- ₹320.00',
      'isDebit': true,
    },
    {
      'icon': Icons.account_balance,
      'title': 'Axis Bank Credit',
      'subtitle': 'Txn ID: 11223344',
      'amount': '+ ₹5,000.00',
      'isDebit': false,
    },
    {
      'icon': Icons.lightbulb_outline,
      'title': 'Electricity Bill',
      'subtitle': 'Txn ID: 12345678',
      'amount': '- ₹1,200.00',
      'isDebit': true,
    },
    {
      'icon': Icons.lightbulb_outline,
      'title': 'Electricity Bill',
      'subtitle': 'Txn ID: 12345678',
      'amount': '- ₹1,200.00',
      'isDebit': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _transactions.length,
      separatorBuilder: (_, __) => const Divider(height: 5),
      itemBuilder: (context, index) {
        final txn = _transactions[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(txn['icon'], color: Colors.teal, size: 24,),
          ),
          title: Text(
            txn['title'],
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
          ),
          subtitle: Text(
            txn['subtitle'],
            style: const TextStyle(fontSize: 10),
          ),
          trailing: Text(
            txn['amount'],
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: txn['isDebit'] ? Colors.red : Colors.green,
            ),
          ),
        );
      },
    );
  }
}
