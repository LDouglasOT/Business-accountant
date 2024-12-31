import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: BezierClipper(),
            child: Container(
              color: AppColors.buttons,
              height: 230,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Welcome text
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 170,),
                    
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.buttons,
                            ),
                            
                            child: Icon(Icons.phone,color: AppColors.blacks,)
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
                    
                    const SizedBox(height: 16),
                   
            
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '••••••••',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.buttons,
                            ),
                            
                            child: Icon(Icons.lock_outline,color: AppColors.blacks,),
                            ),
                        ),
                        
                        
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Sign in button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/dashboard');
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.blacks,
                          backgroundColor: AppColors.blacks,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Bottom links
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              color: AppColors.blacks,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: AppColors.blacks,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class BezierClipper extends CustomClipper<Path>{
  @override
Path getClip(Size size){
  Path path = new Path();
  path.lineTo(0, size.height*0.95); //vertical line
  path.cubicTo(size.width/3, size.height, 2*size.width/3, size.height*0.7, size.width, size.height*0.80); //cubic curve
  path.lineTo(size.width, 0); //vertical line
  return path;
}
@override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}