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
        margin: EdgeInsets.only(top: 60, left: 20),
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
            SizedBox(height: 10),
            Center(
              child: Image.asset(
                "assets/images/pizza1.png",
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text("Cheese Pizza", style: AppWidget.HeadlineTextStyle()),
            Text("\$50", style: AppWidget.PriceTextStyle()),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Cheese pizza features a crispy crust topped with rich tomato sauce and melted mozzarella cheese, offering a deliciously smooth and savory flavor in every bite.",
                style: AppWidget.SimpleTextStyle(),
              ),
            ),
            SizedBox(height: 30),
            Text("Quantity", style: AppWidget.PriceTextStyle()),
            SizedBox(height: 10),
            Row(
              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ),
                SizedBox(width: 20),
                Text("1", style: AppWidget.HeadlineTextStyle()),
                SizedBox(width: 20),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.remove, color: Colors.white, size: 30),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
