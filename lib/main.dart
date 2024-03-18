import 'package:flutter/material.dart';
import 'package:online_shopping/database/cart_provider.dart';
import 'package:online_shopping/screens/cart_screen.dart';
import 'package:online_shopping/screens/login_screen.dart';
import 'package:online_shopping/screens/navigation_screen.dart';
import 'package:online_shopping/screens/payment_method_screen.dart';
import 'package:online_shopping/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ECommerce shopping',
          theme: ThemeData(
            primaryColor: Color(0xFFEF6969),
          ),
          home: SplashScreen(),
        );
      }),
    );
  }
}
