import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/screens/favorites_screen.dart';
import 'package:online_shopping/screens/home_screen.dart';
import 'package:online_shopping/screens/notification_screen.dart';
import 'package:online_shopping/screens/profile/profilescreen.dart';

import 'cart_screen.dart';

class NavigationScreen extends StatefulWidget {
 /* List<dynamic> image;
  String title;
  String description;
  String brand;
  int price;
  int id;
  String category;
  int stock;
  String thumbnail;

  NavigationScreen({
    required this.image,
    required this.title,
    required this.description,
    required this.brand,
    required this.price,
    required this.id,
    required this.category,
    required this.stock,
    required this.thumbnail,
  });*/

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  List<Widget>pages=[
    HomeScreen(),
    notification_Screen(),
    Favorites_Screen(),
    //CartScreen(),
    ProfileScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(
            Icons.qr_code,
            size: 20,
          ),
          backgroundColor: Color(0xFFDB3022),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons:[
          CupertinoIcons.home,
          CupertinoIcons.bell,
          CupertinoIcons.heart,
          //CupertinoIcons.shopping_cart,
          CupertinoIcons.profile_circled,

        ],
        //splash color,
        inactiveColor:Colors.black.withOpacity(0.5),
        activeColor: Color(0xFFDB3022),
        gapLocation:GapLocation.center,
        activeIndex:pageIndex,
        notchSmoothness:NotchSmoothness.softEdge,
        leftCornerRadius:10,
        iconSize:25,
        rightCornerRadius:10,
        elevation:0,
        onTap:(index){
          setState(() {
            pageIndex=index;
          });
        },
      ),
    );
  }
}

