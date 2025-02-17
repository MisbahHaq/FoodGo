import 'package:flutter/material.dart';
import 'package:foodgo/Service/widget_support.dart';

class DetailPage extends StatefulWidget {
  String? image;
  String? name;
  String? price;
  String? desc;
  DetailPage({this.image, this.name, this.price, this.desc});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1, totalprice = 0;

  @override
  void initState() {
    totalprice = int.parse(widget.price!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20),
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
                widget.image!,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(widget.name!, style: AppWidget.HeadlineTextStyle()),
            Text("\$" + widget.price!, style: AppWidget.PriceTextStyle()),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(widget.desc!, style: AppWidget.SimpleTextStyle()),
            ),
            SizedBox(height: 30),
            Text("Quantity", style: AppWidget.PriceTextStyle()),
            SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity = quantity + 1;
                    totalprice = totalprice + int.parse(widget.price!);
                    setState(() {});
                  },
                  child: Material(
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
                ),
                SizedBox(width: 20),
                Text(quantity.toString(), style: AppWidget.HeadlineTextStyle()),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    quantity = quantity - 1;
                    totalprice = totalprice - int.parse(widget.price!);
                    setState(() {});
                  },
                  child: Material(
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
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "\$" + totalprice.toString(),
                        style: AppWidget.BoldWhiteTextStyle(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Order Now",
                        style: AppWidget.WhiteTextStyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
