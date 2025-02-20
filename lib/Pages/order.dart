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
        child: Column(
          children: [
            Row(
              children: [Text("Booking", style: AppWidget.HeadlineTextStyle())],
            ),
          ],
        ),
      ),
    );
  }
}
