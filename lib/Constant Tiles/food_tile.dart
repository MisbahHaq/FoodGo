import 'package:flutter/material.dart';
import 'package:foodgo/Service/widget_support.dart';

Widget FoodTile(String name, String image, String price) {
  return Container(
    margin: EdgeInsets.only(right: 20),
    padding: EdgeInsets.only(left: 10, top: 10),
    decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            image,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
        Text(name, style: AppWidget.BoldTextStyle()),
        Text("\$" + price, style: AppWidget.PriceTextStyle()),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(color: Color(0xffef2b39)),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
