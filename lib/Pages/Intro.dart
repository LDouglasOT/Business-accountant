import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Config/Colors.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/intro.png",
            height: 230,
            width: 200,
          ),
          SizedBox(height: 20),
          Text(
            "Your Stock, Expenses, Time, Profits, Marketing, and Income\n managed in a single app",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              // Add navigation logic here
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Continue to Login",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
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
