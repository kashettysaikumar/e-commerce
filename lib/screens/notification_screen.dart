import 'package:flutter/material.dart';

class notification_Screen extends StatefulWidget {
  const notification_Screen({super.key});

  @override
  State<notification_Screen> createState() => _notification_ScreenState();
}

class _notification_ScreenState extends State<notification_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/notification.png"),
                )),
              ),
            ),
            Text(
              "No Notification!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFDB3022),
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30),
            Text(
              "Looks Like You didn\'t \n"
              " add anything to your cart yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
