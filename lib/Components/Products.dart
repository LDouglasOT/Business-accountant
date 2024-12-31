import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Config/Colors.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  double _scaleFactor = 1.0;
  String _selectedOption = '1kg';

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scaleFactor = 1.1;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scaleFactor = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scaleFactor = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/icons8-transaction-48.png',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [                 
                Text(
                  'Tororo Cement',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '20 left',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                ],
                ),
                const SizedBox(height: 8),
                Text(
                  '1@UGX 15,000',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 10),
                // DropdownButton<String>(
                //   value: _selectedOption,
                //   icon: const Icon(Icons.arrow_drop_down),
                //   elevation: 16,
                //   style: TextStyle(color: Colors.black, fontSize: 13),
                //   dropdownColor: Colors.white,
                //   underline: Container(
                //     height: 1,
                //     color: Colors.grey.shade300,
                //   ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       _selectedOption = newValue!;
                //     });
                //   },
                //   items: <String>['1kg', '500g', '250g', '2kg']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
              ],
            ),
          ),
          GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            onTap: () {
              print('Add button tapped');
            },
            child: AnimatedScale(
              scale: _scaleFactor,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              child: Container(
                width: 60,
                height: 35,
                decoration: BoxDecoration(
                  color: AppColors.buttons,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'ADD',
                    style: GoogleFonts.lato(
                      color: AppColors.appwhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
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
