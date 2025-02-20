import 'package:flutter/material.dart';
import 'package:foodgo/Service/widget_support.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Orders", style: AppWidget.HeadlineTextStyle())],
            ),
          ],
        ),
      ),
    );
  }
}
