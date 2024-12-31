import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer/Config/Colors.dart';
import 'package:retailer/Context/ProductProvider.dart';
import 'package:retailer/Context/LoginProvider.dart';
import 'package:retailer/Pages/Analytics.dart';
import 'package:retailer/Pages/Cart.dart';
import 'package:retailer/Pages/Dashboard.dart';
import 'package:retailer/Pages/Expenses.dart';
import 'package:retailer/Pages/GoalsPage.dart';
import 'package:retailer/Pages/Intro.dart';
import 'package:retailer/Pages/LoanEditPage.dart';
import 'package:retailer/Pages/Loaned.dart';
import 'package:retailer/Pages/Login.dart';
import 'package:retailer/Pages/MainPage.dart';
import 'package:retailer/Pages/MenuPage.dart';
import 'package:retailer/Pages/Register.dart';
import 'package:retailer/Pages/Salaries.dart';
import 'package:retailer/Pages/TodoListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Urbanist",
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.dark),
        initialRoute: '/edits',
        routes: {
          '/':(context) => MenuPage(),
          '/register':(context) => RegistrationPage(),
          '/login':(context) => Login(),
          '/intro':(context) => Intro(),
          '/cart':(context) => Cart(),
          '/store': (context) => MainPage(),
          '/analytics': (context) => AnalyticsPage(),
          '/expenses':(context) => Expenses(),
          '/dashboard':(context) => Dashboard(),
          '/salaries':(context) => Salaries(),
          '/todos':(context) => TodoListPage(),
          '/goals':(context) => GoalsPage(),
          '/loans':(context) => Loans(),
          '/edits':(context) => LoanEditPage(),

        },
      ),
    );
  }
}
