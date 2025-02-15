import 'package:flutter/material.dart';

Widget FoodTile(String name, String image, String price) {
  return Container(
    child: Column(
      children: [
        Image.asset(
          image,
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        Text("Cheese Pizza"),
        Text("\$40")
      ],
    ),
  );
}
