import 'package:flutter/material.dart';
import 'package:online_shopping/screens/profile/components/profile_menu.dart';
import 'package:online_shopping/screens/profile/components/profile_pic.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(height: 30),
        profile_pic(),
        SizedBox(height: 20),
        ProfileMenu(
          icon: Icon(Icons.person,color: Color(0xFFDB3022),),
          text: 'My Account',
          press: () {  },
        ),
        ProfileMenu(
          icon: Icon(Icons.notifications,color: Color(0xFFDB3022),),
          text: 'Notification',
          press: () {  },
        ),
        ProfileMenu(
          icon: Icon(Icons.settings,color: Color(0xFFDB3022),),
          text: 'Settings',
          press: () {  },
        ),
        ProfileMenu(
          icon: Icon(Icons.help,color: Color(0xFFDB3022),),
          text: 'Help Center',
          press: () {  },
        ),
        ProfileMenu(
          icon: Icon(Icons.exit_to_app,color: Color(0xFFDB3022),),
          text: 'Log Out',
          press: () {  },
        ),
      ],
      ),
    );
  }
}
/*class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.text,
    required this.press}
      );

  final String text ;
  final VoidCallback press;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: press,
        child: Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: icon,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
