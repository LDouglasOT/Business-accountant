import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:retailer/Config/Colors.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<ExpenseCategory> categories = [
    ExpenseCategory(icon: Icons.credit_card, title: 'Expenses',route: '/expenses'),
    ExpenseCategory(icon: Icons.home, title: 'Stock',route: '/store'),
    ExpenseCategory(icon: Icons.payment, title: 'Sales Point',route: '/store'),
    ExpenseCategory(icon: Icons.local_gas_station, title: 'Salaries',route:'/salaries'),
    ExpenseCategory(icon: Icons.security, title: 'Analytics',route: '/analytics'),
    ExpenseCategory(icon: Icons.fastfood, title: 'Tasks',route: '/todos'),
    ExpenseCategory(icon: Icons.electric_bolt, title: 'Goals',route: '/goals'),
    ExpenseCategory(icon: Icons.phone_android, title: 'Loans',route: '/analytics'),
    ExpenseCategory(icon: Icons.movie, title: 'Documents',route:'/analytics'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.buttons,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    Row(
                      children: [
                        Icon(Icons.tune, color: Colors.black),
                        SizedBox(width: 16),
                        Icon(Icons.more_vert, color: Colors.black),
                      ],
                    ),
                  ],
                                ),
                                SizedBox(height: 20),
                                
                                // Salary Card
                                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Report',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Salary Remaining',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$54,134/\$65,534',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        radius: 30.0,
                        lineWidth: 5.0,
                        percent: 0.85,
                        center: Text('85%'),
                        progressColor: Colors.amber,
                        backgroundColor: Colors.amber.withOpacity(0.2),
                      ),
                    ],
                  ),
                                ),
                  ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              
              // Grid of Categories
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(category: categories[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final ExpenseCategory category;

  const CategoryTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(category.route)
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.buttons,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              category.icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(height: 8),
          Text(
            category.title,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.blacks,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseCategory {
  final IconData icon;
  final String title;
  final String route;

  ExpenseCategory({
    required this.icon,
    required this.title,
    required this.route
  });
}