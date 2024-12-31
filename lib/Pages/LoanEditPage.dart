import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class LoanEditPage extends StatefulWidget {
  const LoanEditPage({super.key});

  @override
  State<LoanEditPage> createState() => _LoanEditPageState();
}

class _LoanEditPageState extends State<LoanEditPage> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'quantity': 1, 'price': 3000000},
    {'name': 'Phone', 'quantity': 2, 'price': 1000000},
    {'name': 'Tablet', 'quantity': 1, 'price': 1500000},
  ];

  final List<Map<String, dynamic>> payments = [
    {'amount': 2000000, 'date': '2024-12-20'},
    {'amount': 1000000, 'date': '2025-01-05'},
  ];

  final TextEditingController paymentAmountController =
      TextEditingController();
  final TextEditingController paymentDateController = TextEditingController();

  void addPayment() {
    final amount = double.tryParse(paymentAmountController.text);
    final date = paymentDateController.text;

    if (amount != null && date.isNotEmpty) {
      setState(() {
        payments.add({'amount': amount, 'date': date});
      });

      // Clear the inputs
      paymentAmountController.clear();
      paymentDateController.clear();
    } else {
      // Show an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid payment details')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPaid = payments.fold(0, (sum, payment) => sum + payment['amount']);
    double totalLoan = products.fold(0,
        (sum, product) => sum + (product['price'] * product['quantity']));
    double outstandingAmount = totalLoan - totalPaid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        title: Text('Edit Loan',style: TextStyle(color: AppColors.blacks,fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loan Summary
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loan Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Total Loan: UGX $totalLoan'),
                      Text('Total Paid: UGX $totalPaid'),
                      Text('Outstanding: UGX $outstandingAmount'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Products Section
              Text(
                'Products Taken on Loan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ...products.map((product) {
                return ListTile(
                  title: Text(product['name'],style: TextStyle(color: AppColors.blacks)),
                  subtitle: Text(
                      'Quantity: ${product['quantity']}, Price: UGX ${product['price']}',style: TextStyle(color: AppColors.blacks)),
                  trailing: Text(
                      'Total: UGX ${product['quantity'] * product['price']}',style: TextStyle(color: AppColors.blacks)),
                );
              }).toList(),
              const SizedBox(height: 20),
              // Payments Section
              Text(
                'Loan Payments',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ...payments.map((payment) {
                return ListTile(
                  leading: Icon(Icons.payment, color: Colors.green),
                  title: Text('UGX ${payment['amount']}',style: TextStyle(color: AppColors.blacks)),
                  subtitle: Text('Date: ${payment['date']}',style: TextStyle(color: AppColors.blacks),),
                );
              }).toList(),
              const SizedBox(height: 20),
              // Payment Edit Section
              Text(
                'Make/Edit Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: paymentAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Payment Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width*0.93,
                child: ElevatedButton(
                  onPressed: addPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttons,
                  ),
                  child: Text('Save Payment',style: TextStyle(color: AppColors.blacks)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
