import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/OnBoarding/signup.dart';
import 'package:foodgo/Service/widget_support.dart';
import 'package:foodgo/bottomnav.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "", name = "";
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No User Found fot that Email",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                padding: EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffffefbf),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pan.png",
                      height: 180,
                      fit: BoxFit.fill,
                      width: 240,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3,
                  left: 20,
                  right: 20,
                ),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: MediaQuery.of(context).size.height / 1.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Login",
                            style: AppWidget.HeadlineTextStyle(),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text("Email", style: AppWidget.SignUpTextStyle()),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: mailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email",
                              prefixIcon: Icon(Icons.mail_outline_outlined),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("Password", style: AppWidget.SignUpTextStyle()),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              prefixIcon: Icon(Icons.password_outlined),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password",
                              style: AppWidget.SimpleTextStyle(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            if (mailController.text != "" &&
                                passwordController.text != "") {
                              setState(() {
                                email = mailController.text;
                                password = passwordController.text;
                              });
                              userLogin();
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffef2b39),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: AppWidget.BoldWhiteTextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: AppWidget.SimpleTextStyle(),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                "SignUp",
                                style: AppWidget.BoldTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
