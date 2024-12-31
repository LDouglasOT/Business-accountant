import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Config/Colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.primary,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Douglas',
                        style: GoogleFonts.lato(
                            color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        'Welcome back!',
                        style: GoogleFonts.lato(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 15),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://www.shutterstock.com/shutterstock/photos/1775086994/display_1500/stock-photo-brand-new-electrical-socket-isolated-on-gray-wall-renovated-studio-apartment-power-supply-1775086994.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

         Container(
              width: double.infinity,
              color: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: Text(
                  'Douglas Shop',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildMenuCard(
                        title: "Expenses",
                        icon: Icons.money_off,
                        color: AppColors.primary),
                    _buildMenuCard(
                        title: "Stock",
                        icon: Icons.inventory,
                        color: AppColors.primary),
                    _buildMenuCard(
                        title: "Sales Point",
                        icon: Icons.point_of_sale,
                        color: AppColors.primary),
                    _buildMenuCard(
                        title: "Salaries",
                        icon: Icons.attach_money,
                        color: AppColors.primary),
                    _buildMenuCard(
                        title: "Analytics",
                        icon: Icons.analytics,
                        color: AppColors.primary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
      {required String title, required IconData icon, required Color color}) {
    return GestureDetector(
      onTap: () {
        print('$title clicked');
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.lato(
                  fontSize: 16, fontWeight: FontWeight.w600, color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
