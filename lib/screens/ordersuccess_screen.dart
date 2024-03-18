import 'package:flutter/material.dart';
import 'package:online_shopping/screens/home_screen.dart';
import 'package:online_shopping/screens/navigation_screen.dart';
import 'package:online_shopping/widgets/container_button_modal.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Column(children: [
           Image.asset("assets/success.png",
           height: 200),
           SizedBox(height: 20),
           Text("Success!",
             style: TextStyle(
               fontSize: 40,
               fontWeight: FontWeight.w600,
               letterSpacing: 1,
             ),
           ),
           SizedBox(height: 10),
           Text("Your order will be delivered soon",
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w400,
             ),),
           //SizedBox(height: 10),
           Text("Thank you! For choosing our app",
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w400,
             ),),
         ],
         ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NavigationScreen(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ContainerButtonModel(
                itext: "Continue Shopping",
                containerWidth: MediaQuery.of(context).size.width,
                bgColor:  Color(0xFFDB3022),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
