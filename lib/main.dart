import 'package:flutter/material.dart';
import 'screens/barcode_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'dart:async';
import 'screens/user_home_screen.dart';
import 'screens/card_info_screen.dart';
import 'database.dart';
import 'screens/options_screen.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/transaction_screen.dart';
import 'screens/statistique_screen.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (ctx) => LoginScreen(),
        '/registration': (ctx) => RegistrationScreen(),
        '/transaction': (ctx) => MyAccountScreen(),
        '/statistique': (context) => StatistiqueScreen(),
        '/card_info': (context) => AccountPage(),
        '/barcode': (context) => QRCodePage(),
        '/options': (context) => PaymentScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/log.jpeg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 26),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '©Copyright',
                  style: TextStyle(
                    color: Color.fromRGBO(171, 127, 7, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

