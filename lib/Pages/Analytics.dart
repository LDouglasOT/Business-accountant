import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For sales graph
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Config/Colors.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  String selectedFilter = 'Month';
  double earnings = 1500.00;
  double expenses = 500.00;
  double losses = 200.00;
  double loanedAmount = 1000.00;
  double expiredItemsLoss = 50.00;
  double salesPerEmployee = 400.00;
  List<Map<String, dynamic>> salesData = [
    {'month': 'Jan', 'sales': 2000},
    {'month': 'Feb', 'sales': 3000},
    {'month': 'Mar', 'sales': 4000},
    {'month': 'Apr', 'sales': 7000},
    {'month': 'May', 'sales': 9000},
    {'month': 'Jun', 'sales': 1000},
    {'month': 'Jul', 'sales': 1200},
    {'month': 'August', 'sales': 10},
    {'month': 'September', 'sales': 4150},
    {'month': 'October', 'sales': 0},
    {'month': 'November', 'sales': 0},
    {'month': 'December', 'sales': 0},
  ];
  // 10.46.204.65, 192.168.38.8, 10.7.3.36

  List<String> filterButtons = ['Month', 'Week', 'Year'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        foregroundColor: AppColors.blacks,
        title: Text('Analytics Dashboard', style: GoogleFonts.lato()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: filterButtons.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            selectedFilter == filter
                                ? AppColors.buttons
                                : AppColors.blacks),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Summary Cards
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  var item = [
                    {'title': 'Earnings', 'value': earnings, 'color': Colors.green},
                    {'title': 'Expenses', 'value': expenses, 'color': Colors.red},
                    {'title': 'Losses', 'value': losses, 'color': Colors.orange},
                    {'title': 'Loaned Amount', 'value': loanedAmount, 'color': Colors.blue},
                  ];
                  var analytic = item[index];
                  return Card(

                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Earnings', style: GoogleFonts.lato(fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                            '\$${analytic['value']}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttons,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sales Overview', style: GoogleFonts.lato(fontSize: 18)),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                spots: salesData
                                    .map((e) =>
                                        FlSpot(salesData.indexOf(e).toDouble(), e['sales'].toDouble()))
                                    .toList(),
                                isCurved: true,
                                color: AppColors.buttons,
                                belowBarData: BarAreaData(show: true, color: AppColors.primary.withOpacity(0.3)),
                              ),
                            ],
                            gridData: FlGridData(show: true),
                            titlesData: FlTitlesData(show: true),
                            borderData: FlBorderData(show: true),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Additional Metrics
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  var item = [
                    {'title': 'Top Selling Products', 'content': 'Product A, B, C'},
                    {'title': 'Biggest Seller Month', 'content': 'March'},
                    {'title': 'Expired Items Loss', 'content': '\$${expiredItemsLoss.toStringAsFixed(2)}'},
                    {'title': 'Sales Per Employee', 'content': '\$${salesPerEmployee.toStringAsFixed(2)}'},
                  ][index];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title'] ?? "", style: GoogleFonts.lato(fontSize: 16),),
                          SizedBox(height: 10),
                          Text(item['content'] ?? "", style: TextStyle(fontSize: 18,color: AppColors.primary)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
