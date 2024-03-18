import 'package:flutter/material.dart';
import 'package:online_shopping/screens/profile/components/body.dart';

import '../navigation_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationScreen()));
        }, icon: Icon(Icons.arrow_back_ios),),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
    body: Body(),

    );
  }
}
