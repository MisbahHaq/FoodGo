import 'package:flutter/material.dart';
import 'package:foodgo/Service/widget_support.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/pizza1.png",
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            Text("Cheese Pizza", style: AppWidget.HeadlineTextStyle()),
            Text("\$50", style: AppWidget.PriceTextStyle()),
            SizedBox(height: 20),
            Text(
              "Cheese pizza features a crispy crust topped with rich tomato sauce and melted mozzarella cheese, offering a deliciously smooth and savory flavor in every bite.",
            ),
          ],
        ),
      ),
    );
  }
}
