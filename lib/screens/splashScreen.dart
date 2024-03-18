import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shopping/screens/home_screen.dart';
import 'package:online_shopping/screens/login_screen.dart';
import 'package:online_shopping/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnboadingScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/image7.jpg"),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 180,
              color: Color(0xFFDB3022),
            ),
            Text(
              "DP SHOP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
