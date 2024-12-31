import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  int selectedFilterIndex = 0; // 0 = All, 1 = Paid, 2 = Unpaid
  final List<String> filters = ['All', 'Paid', 'Unpaid']; // Filters
  List<Map<String, dynamic>> loans = [
    {
      'name': 'Business Loan',
      'loanDate': '2024-12-15',
      'dueDate': '2025-01-15',
      'totalAmount': 5000000,
      'paidAmount': 2000000,
    },
    {
      'name': 'Car Loan',
      'loanDate': '2024-11-20',
      'dueDate': '2025-01-01',
      'totalAmount': 3000000,
      'paidAmount': 3000000,
    },
    {
      'name': 'Education Loan',
      'loanDate': '2024-12-01',
      'dueDate': '2025-02-01',
      'totalAmount': 4000000,
      'paidAmount': 1000000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredLoans = loans.where((loan) {
      if (selectedFilterIndex == 1) {
        return loan['paidAmount'] == loan['totalAmount']; // Paid
      } else if (selectedFilterIndex == 2) {
        return loan['paidAmount'] < loan['totalAmount']; // Unpaid
      }
      return true; // All
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        title: Text(
          'Loans Tracker',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Add your loan action here
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blacks,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Add Loan',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Loan Summary
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.buttons,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Paid:',
                    style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Text(
                    'UGX 6,000,000',
                    style: TextStyle(
                      color: AppColors.blacks,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Outstanding:',
                    style: TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Text(
                    'UGX 6,000,000',
                    style: TextStyle(
                      color: AppColors.blacks,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(filters.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilterIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedFilterIndex == index
                          ? AppColors.blacks
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      filters[index],
                      style: TextStyle(
                        color: selectedFilterIndex == index
                            ? Colors.white
                            : AppColors.blacks,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          // Loan List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: filteredLoans.length,
              itemBuilder: (context, index) {
                final loan = filteredLoans[index];
                final isPaid = loan['paidAmount'] == loan['totalAmount'];
                final outstandingAmount =
                    loan['totalAmount'] - loan['paidAmount'];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isPaid
                          ? Colors.green
                          : Colors.orangeAccent,
                      child: Icon(
                        isPaid ? Icons.check : Icons.pending,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      loan['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Loan Date: ${loan['loanDate']}'),
                        Text('Due Date: ${loan['dueDate']}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Paid: UGX ${loan['paidAmount']}',
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          'Outstanding: UGX $outstandingAmount',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Add navigation to loan details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
