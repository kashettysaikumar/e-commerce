

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/screens/otp_screen.dart';
import 'package:online_shopping/screens/recovery_screen.dart';

class ForgetScreen  extends StatefulWidget {
  const ForgetScreen ({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  bool clrButton = false;

  TextEditingController emailController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Forget Password",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height: 60),
              Text("Please enter your email address.You will receive a link to create or set a  new password via email",
              style: TextStyle(
                fontSize: 15,
              ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                onChanged: (val){
                  if (val !=""){
                    setState(() {
                      clrButton=true;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  suffix:InkWell(
                    onTap: () {
                      emailController.clear();
                    },
                    child: Icon(
                      CupertinoIcons.multiply,
                      color: Color(0xFFDB3022),),
                  )
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecoveryScreen(),
                      ));
                },
                child: Text(
                  "Send Code",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Color(0xFFDB3022),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text("or"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(),
                    ));
                  },
                    child:Text(
                      "Verify Using Number",
                      style: TextStyle(
                        color: Color(0xFFDB3022),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
