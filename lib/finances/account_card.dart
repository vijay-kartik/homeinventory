import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String balance;
  final String accountType;

  const AccountCard({
    Key? key,
    required this.bankName,
    required this.accountNumber,
    required this.balance,
    required this.accountType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bankName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(accountNumber),
            Text(accountType),
            const SizedBox(height: 8.0),
            Text(balance, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
} 