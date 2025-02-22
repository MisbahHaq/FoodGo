import 'package:flutter/material.dart';
import 'package:foodgo/Model/burger_model.dart';
import 'package:foodgo/Model/category_model.dart';
import 'package:foodgo/Model/chinese_model.dart';
import 'package:foodgo/Model/mexican_model.dart';
import 'package:foodgo/Model/pizza_model.dart';
import 'package:foodgo/Pages/detail_page.dart';
import 'package:foodgo/Food%20Data/burger_data.dart';
import 'package:foodgo/Food%20Data/category_data.dart';
import 'package:foodgo/Food%20Data/chinese_data.dart';
import 'package:foodgo/Food%20Data/mexican_data.dart';
import 'package:foodgo/Food%20Data/pizza_data.dart';
import 'package:foodgo/Service/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  List<BurgerModel> burger = [];
  List<ChineseModel> chinese = [];
  List<MexicanModel> mexican = [];
  String track = "0";
  @override
  void initState() {
    categories = getCategories();
    pizza = getPizza();
    burger = getBurger();
    chinese = getChinese();
    mexican = getMexican();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 50,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Order your favourite food!",
                      style: AppWidget.SimpleTextStyle(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/boy.jpg",
                      height: 65,
                      width: 65,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffececef8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search food item..",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categories[index].name!,
                    categories[index].image!,
                    index.toString(),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            track == "0"
                ? Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.69,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: pizza.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        pizza[index].name!,
                        pizza[index].image!,
                        pizza[index].price!,
                        pizza[index].desc!,
                      );
                    },
                  ),
                )
                : track == "1"
                ? Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.69,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: burger.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        burger[index].name!,
                        burger[index].image!,
                        burger[index].price!,
                        burger[index].desc!,
                      );
                    },
                  ),
                )
                : track == "2"
                ? Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.69,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: chinese.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        chinese[index].name!,
                        chinese[index].image!,
                        chinese[index].price!,
                        chinese[index].desc!,
                      );
                    },
                  ),
                )
                : track == "3"
                ? Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.69,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: mexican.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        mexican[index].name!,
                        mexican[index].image!,
                        mexican[index].price!,
                        mexican[index].desc!,
                      );
                    },
                  ),
                )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price, String desc) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
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
          Text("Rs " + price, style: AppWidget.PriceTextStyle()),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DetailPage(
                            image: image,
                            name: name,
                            price: price,
                            desc: desc,
                          ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget CategoryTile(String name, String image, String categoryindex) {
    return GestureDetector(
      onTap: () {
        track = categoryindex.toString();
        setState(() {});
      },
      child:
          track == categoryindex
              ? Container(
                margin: EdgeInsets.only(right: 20, bottom: 10),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          image,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Text(name, style: AppWidget.WhiteTextStyle()),
                      ],
                    ),
                  ),
                ),
              )
              : Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(right: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text(name, style: AppWidget.SimpleTextStyle()),
                  ],
                ),
              ),
    );
  }
}
