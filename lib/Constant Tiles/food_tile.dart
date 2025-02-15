import 'package:flutter/material.dart';
import 'package:foodgo/Service/widget_support.dart';

Widget FoodTile(String name, String image, String price) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        Text(
          name,
          style: AppWidget.BoldTextStyle(),
        ),
        Text(
          "\$40",
          style: AppWidget.PriceTextStyle(),
        )
      ],
    ),
  );
}
