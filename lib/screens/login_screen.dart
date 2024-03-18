import 'package:flutter/material.dart';
import 'package:online_shopping/screens/signupscreen.dart';
import 'Navigation_Screen.dart';
import 'forget_screen.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool passwordVisibility = true;

  Future<void> login() async {
    if (emailController.text.isNotEmpty &&
        passController.text.isNotEmpty) {
      var httpResponse = http.Client();
      var response = await httpResponse.post(Uri.parse("https://dummyjson.com/auth/login"),body: ({
        'username': emailController.text.toString(),
        'password': passController.text.toString(),
      }));
      //print(response.statusCode);
      if (response.statusCode ==200) {

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationScreen(),));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid Credentials")));
        print("invalied");
        print(response.body);
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Enter Username and Password")));
      print("enter user name");


    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 110),
                Image.asset('assets/freed.png'),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,

                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetScreen(),
                                ));
                          },
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              color: Color(0xFFEF6969),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            login();
                          });
                        },
                        child: Text(
                          "Log In",
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
                      SizedBox(height: 20),
                      Text("OR"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have an Account?",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ));
                            },
                            child: Text(
                              "sign up",
                              style: TextStyle(
                                color: Color(0xFFEF6969),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

}


