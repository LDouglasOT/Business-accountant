import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retailer/Components/Products.dart';
import 'package:retailer/Config/Colors.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:retailer/Context/ProductProvider.dart'; 
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {



  @override
  Widget build(BuildContext context) {
    final cartItemCount = context.watch<ProductProvider>().cart.length; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Sales Point',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.blacks
          ),
        ),
        actions: [
         Stack(
      children: [
        IconButton(
          onPressed: () {
    
          },
          icon: Icon(
            Icons.shopping_bag,
            color: AppColors.blacks,
            size: 30,
          ),
        ),
        if (cartItemCount > 0) 
          Positioned(
            right: 4, 
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$cartItemCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appwhite,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.grey[100],
                          border: Border.all(
                          color: AppColors.text,  
                          width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Product",
                            hintStyle: TextStyle(color: Colors.black45),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.buttons,
                                ),
                                
                                child: Icon(Icons.search,color: AppColors.blacks,)
                                ),
                          ),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                          ),
                        
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttons),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () async {
             
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BarcodeScannerPage(),
                            ),
                          );

             
                          if (result != null) {
                            print("Scanned barcode: $result");
                         
                          }
                        },
                        icon: Icon(
                          Icons.qr_code_scanner,
                          color: AppColors.buttons,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: Text(
                  '300 Products',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
             ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 6,
  itemBuilder: (context, index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Products(),
        ),
      
        if (index < 5) 
          Divider(
            thickness: 1, 
            color: Colors.grey.shade300,
            indent: 16, 
            endIndent: 16,
          ),
      ],
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

// Barcode scanner page
class BarcodeScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'),
        backgroundColor: AppColors.primary,
      ),
      body: AiBarcodeScanner(
        // onScan: (String value) {
        //   Navigator.pop(context, value); // Return the scanned value
        // },
        // canPop: true, // Allows user to cancel the scanning process
      ),
    );
  }
}
