import 'package:flutter/material.dart';
import 'package:foodgo/OnBoarding/signup.dart';
import 'package:foodgo/Pages/detail_page.dart';
import 'package:foodgo/Pages/home.dart';
import 'package:foodgo/Pages/onBoarding.dart';
import 'package:foodgo/bottomnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignUp());
  }
}
