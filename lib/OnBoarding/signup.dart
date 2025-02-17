import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.1,
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
          ],
        ),
      ),
    );
  }
}
