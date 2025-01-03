import 'package:flutter/material.dart';
import 'account_card.dart'; // Import the account card widget
import 'subscription_card.dart'; // Import the subscription card widget
import 'transaction_table.dart'; // Import the transaction table widget
// import 'monthly_overview_graph.dart'; // Import the graph widget
import 'loan_card.dart';
import 'credit_card_widget.dart';

class FinanceDashboard extends StatelessWidget {
  const FinanceDashboard({Key? key}) : super(key: key);

  // Add this helper method to parse and sum up balances
  double _calculateTotalBalance() {
    final balances = [
      '₹45,250.00',
      '₹28,150.00',
      '₹51,100.00',
    ];
    
    double total = 0;
    for (String balance in balances) {
      // Remove ₹ symbol and commas, then parse to double
      String cleanBalance = balance.replaceAll('₹', '').replaceAll(',', '');
      total += double.parse(cleanBalance);
    }
    return total;
  }

  // Add this method to calculate total credit card outstanding
  double _calculateTotalOutstanding() {
    final outstandings = [
      '₹35,000.00',
      '₹22,500.00',
    ];
    
    double total = 0;
    for (String amount in outstandings) {
      String cleanAmount = amount.replaceAll('₹', '').replaceAll(',', '');
      total += double.parse(cleanAmount);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Finance Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balances Section
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Balances',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildBalancesSection(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Accounts Section
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Accounts',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildAccountsSection(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Credit Cards Section
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Credit Cards',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Outstanding: ₹${_calculateTotalOutstanding().toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildCreditCardsSection(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Active Loans Section
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Active Loans',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildLoansSection(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Expenses Overview',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Active Subscriptions Section
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Active Subscriptions',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildSubscriptionsSection(),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Recent Transactions Section
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Transactions',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const TransactionTable(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBalancesSection() {
    final totalBalance = _calculateTotalBalance();
    final availableToSpend = totalBalance - _calculateTotalOutstanding();
    
    String formatBalance(double amount) {
      return amount.toStringAsFixed(2)
          .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Container(
          width: screenWidth * 0.2, // 20% of screen width
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Account Balance
              const Text(
                'Total Account Balance',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '₹${formatBalance(totalBalance)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              // Available to Spend
              const Text(
                'Available to Spend',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '₹${formatBalance(availableToSpend)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildAccountsSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AccountCard(
            bankName: 'Chase Bank',
            accountNumber: '**** 4323',
            balance: '₹45,250.00',
            accountType: 'Checking Account',
          ),
          const SizedBox(width: 16),
          AccountCard(
            bankName: 'Bank of America',
            accountNumber: '**** 8981',
            balance: '₹28,150.00',
            accountType: 'Savings Account',
          ),
          const SizedBox(width: 16),
          AccountCard(
            bankName: 'Wells Fargo',
            accountNumber: '**** 1234',
            balance: '₹51,100.00',
            accountType: 'Investment Account',
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubscriptionCard(
          serviceName: 'Spotify Premium',
          nextPayment: 'Mar 15, 2025',
          amount: '₹9.99/mo',
          bank: 'Chase **** 4323',
        ),
        SubscriptionCard(
          serviceName: 'Netflix Premium',
          nextPayment: 'Nov 30, 2025',
          amount: '₹14.99/mo',
          bank: 'BOA **** 8981',
        ),
        SubscriptionCard(
          serviceName: 'Adobe Creative Cloud',
          nextPayment: 'Mar 25, 2025',
          amount: '₹52.99/mo',
          bank: 'Chase **** 4323',
        ),
      ],
    );
  }

  Widget _buildLoansSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          LoanCard(
            loanType: 'Scholar Loan',
            bankName: 'SBI Bank',
            totalAmount: '₹12,00,000',
            disbursedAmount: '₹8,00,000',
            emiAmount: '₹15,800',
            debitDate: '5th',
            remainingTenure: 96, // 8 years
          ),
          LoanCard(
            loanType: 'Car Loan',
            bankName: 'ICICI Bank',
            totalAmount: '₹8,00,000',
            disbursedAmount: '₹2,40,000',
            emiAmount: '₹16,500',
            debitDate: '10th',
            remainingTenure: 48,
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCardsSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CreditCardWidget(
            bankName: 'HDFC Bank',
            cardNumber: '**** 1234',
            outstandingAmount: '₹35,000.00',
            creditLimit: '₹1,50,000.00',
            dueDate: 'Mar 15, 2024',
            utilizationPercentage: 0.23,
          ),
          CreditCardWidget(
            bankName: 'ICICI Bank',
            cardNumber: '**** 5678',
            outstandingAmount: '₹22,500.00',
            creditLimit: '₹1,00,000.00',
            dueDate: 'Mar 20, 2024',
            utilizationPercentage: 0.225,
          ),
        ],
      ),
    );
  }
} 