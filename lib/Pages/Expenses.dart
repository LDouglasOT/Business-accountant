import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  int selectedIndex = 0; // Define the selected index
  final List<String> options = ['This week', 'This Month']; // Define the options for the toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        title: Text(
          'Expenses Tracker',
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
                    'Add Transaction',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expense: ',
                        style: TextStyle(color: AppColors.text,fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        'UGX 500,000',
                        style: TextStyle(
                          color: AppColors.blacks,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Monthly Budget: ',
                        style: TextStyle(color: AppColors.text,fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        'UGX 500,000',
                        style: TextStyle(
                          color: AppColors.blacks,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
          
                 
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          // Second Container - Toggle Buttons
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
          SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width-50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('18 may 2024',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 18),),
              Text('28-12-2024',style: TextStyle(color: AppColors.primary,fontSize: 10),)
            ],
          ),
        ),        
       
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Image.asset('assets/images/icons8-transaction-48.png',height: 50,width: 50,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Electricity',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 15),),
                    Text('28-12-2024',style: TextStyle(color: AppColors.primary,fontSize: 10),)
                    ],
                  ),

                  Text('UGX 20000',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 10)),
                  TextButton(onPressed: (){}, child: Text('view',style: TextStyle(color: AppColors.buttons,fontWeight: FontWeight.bold,fontSize: 16),))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Image.asset('assets/images/icons8-transaction-48.png',height: 50,width: 50,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Electricity',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 15),),
                    Text('28-12-2024',style: TextStyle(color: AppColors.primary,fontSize: 10),)
                    ],
                  ),

                  Text('UGX 20000',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 10)),
                  TextButton(onPressed: (){}, child: Text('view',style: TextStyle(color: AppColors.buttons,fontWeight: FontWeight.bold,fontSize: 16),))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Image.asset('assets/images/icons8-transaction-48.png',height: 50,width: 50,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Electricity',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 15),),
                    Text('28-12-2024',style: TextStyle(color: AppColors.primary,fontSize: 10),)
                    ],
                  ),

                  Text('UGX 20000',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 10)),
                  TextButton(onPressed: (){}, child: Text('view',style: TextStyle(color: AppColors.buttons,fontWeight: FontWeight.bold,fontSize: 16),))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Image.asset('assets/images/icons8-transaction-48.png',height: 50,width: 50,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Electricity',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 15),),
                    Text('28-12-2024',style: TextStyle(color: AppColors.primary,fontSize: 10),)
                    ],
                  ),

                  Text('UGX 20000',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 10)),
                  TextButton(onPressed: (){}, child: Text('view',style: TextStyle(color: AppColors.buttons,fontWeight: FontWeight.bold,fontSize: 16),))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Image.asset('assets/images/icons8-transaction-48.png',height: 50,width: 50,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Electricity',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 15),),
                    Text('28-12-2024',style: TextStyle(color: AppColors.primary,fontSize: 10),)
                    ],
                  ),

                  Text('UGX 20000',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blacks,fontSize: 13)),
                  TextButton(onPressed: (){}, child: Text('view',style: TextStyle(color: AppColors.buttons,fontWeight: FontWeight.bold,fontSize: 16),))
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
