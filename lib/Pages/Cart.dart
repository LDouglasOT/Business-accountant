import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Components/Cartcard.dart';
import 'package:retailer/Components/Products.dart';
import 'package:retailer/Config/Colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> cartItems = [];

  @override
  void initState() {
    super.initState();
    // Generate some random data for the cart
    cartItems = List.generate(15, (index) => 'Item ${index + 1}');
  }

  void _showCheckoutOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.buttons,
          title: Text("Total Cost: UGX 4,000,000",style: GoogleFonts.lato(color:Colors.white,fontSize:15),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Sale on Loan option selected
                  Navigator.pop(context);
                  // Add your logic for sale on loan
                },
                child: Text("Loan Payment"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cash Payment"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Cart',
          style: GoogleFonts.lato(color: AppColors.blacks, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: Text(
              'UGX 5,000,0000',
              style: GoogleFonts.lato(color: AppColors.blacks, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Dismissible(
                key: Key(item),
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                ),
                onDismissed: (direction) {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Deleted $item'),
                    ),
                  );
                },
                child: ListTile(
                  title: Cartcard(),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  _showCheckoutOptions();
                },
                child: Container(
                  color: AppColors.buttons,
                  child: Center(
                    child: Text(
                      'Proceed & Checkout',
                      style: GoogleFonts.lato(color: AppColors.blacks, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
