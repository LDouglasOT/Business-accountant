import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retailer/Config/Colors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State{
  var phoneNumberController = TextEditingController();
  var shopNameController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('New account registration',style: GoogleFonts.lato(fontSize:20),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as needed
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: TextField(
                          controller: shopNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Center(child: Icon(Icons.phone)),
                            ),
                          ),
                        ),
                      ),
                    ),
              
                SizedBox(height: 10.0),
                Container(
                   decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as needed
                        color: Colors.white,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      controller: shopNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Shop Name",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(Icons.shopping_bag)),
                        ),
                      )
                    ),
                  ),
                ),
               
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as needed
                        color: Colors.white,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "First Name",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(Icons.person)),
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as needed
                        color: Colors.white,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      controller: lastNameController,
                      decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last Name",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(Icons.person_2)),
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as needed
                        color: Colors.white,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(Icons.lock)),
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Adjust the radius value as needed
                        color: Colors.white,
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(Icons.lock)),
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.white,),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(child: Text('Register',style: TextStyle(color: Colors.grey),))),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}