import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class Salaries extends StatefulWidget {
  const Salaries({super.key});

  @override
  State<Salaries> createState() => _SalariesState();
}

class _SalariesState extends State<Salaries> {
  @override
  int selectedIndex =0;
  final List<String> options = ['This week', 'This Month']; 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        title: Text(
          'Salaries Tracker',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Add your transaction action here
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
                    'Add Employee',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.add,
                    size: 15,
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Savings: ',
                        style: TextStyle(color: AppColors.text,fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        'UGX 500,000',
                        style: TextStyle(
                          color: AppColors.blacks,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                       
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Monthly Salary Budget: ',
                        style: TextStyle(color: AppColors.text,fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        'UGX 500,000',
                        style: TextStyle(
                          color: AppColors.blacks,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
          
                 
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40),
            child: Container(
              width: MediaQuery.of(context).size.height*0.7,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  // Animated selection indicator
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    alignment: selectedIndex == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 32) / 2,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
             
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      options.length,
                      (index) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 36,
            
                            alignment: Alignment.center,
                            child: Text(
                              options[index],
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey[600],
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
           Container(
  width: MediaQuery.of(context).size.width * 0.9,
  padding: const EdgeInsets.symmetric(vertical: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Left section: Icon and user details
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/icons8-transaction-48.png',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 40,
            width: 1,
            color: AppColors.primary,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Douglas Luzinda',
                style: TextStyle(
                  color: AppColors.blacks,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Christmas Bonus',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Successful',
                style: TextStyle(
                  color: const Color.fromARGB(255, 12, 113, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
      // Right section: Transaction details
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'UGX 100,000',
            style: TextStyle(
              color: AppColors.blacks,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '12-May-24',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '07:12 AM',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ],
  ),
)

        
        ],
      ),
    );
  }
}