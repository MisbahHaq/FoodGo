import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodgo/Admin/admin_login.dart';
import 'package:foodgo/Admin/all_orders.dart';
import 'package:foodgo/Admin/home_admin.dart';
import 'package:foodgo/Admin/manage_users.dart';
import 'package:foodgo/OnBoarding/login.dart';
import 'package:foodgo/OnBoarding/signup.dart';
import 'package:foodgo/Pages/detail_page.dart';
import 'package:foodgo/Pages/home.dart';
import 'package:foodgo/OnBoarding/onBoarding.dart';
import 'package:foodgo/Service/keys.dart';
import 'package:foodgo/Service/bottomnav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishedkey;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: onBoarding());
  }
}
