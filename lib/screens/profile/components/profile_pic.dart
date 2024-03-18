import 'package:flutter/material.dart';

class profile_pic extends StatelessWidget {
  const profile_pic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/profile.jpg"),
              ),
              Positioned(
                right: -5,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child:IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: BorderSide.strokeAlignOutside,
                    iconSize: 32,
                    icon: Icon(Icons.camera_alt_outlined),
                    onPressed: (){},
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
