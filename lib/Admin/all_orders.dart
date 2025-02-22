import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/Service/database.dart';
import 'package:foodgo/Service/widget_support.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  Stream<QuerySnapshot>? orderStream;

  getontheload() async {
    orderStream = await DatabaseMethods().getAdminOrders();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allOrders() {
    return StreamBuilder<QuerySnapshot>(
      stream: orderStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> orderSnapshot) {
        if (orderSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (orderSnapshot.hasError) {
          return Center(child: Text('Error: ${orderSnapshot.error}'));
        } else if (!orderSnapshot.hasData || orderSnapshot.data!.docs.isEmpty) {
          return Center(child: Text('No Orders Found'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: orderSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = orderSnapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Color(0xffef2b39),
                              ),
                              SizedBox(width: 10),
                              Text(
                                ds["Address"],
                                style: AppWidget.BoldTextStyle(),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Image.asset(
                                ds["FoodImage"],
                                height: 120,
                                width: 120,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ds["FoodName"],
                                    style: AppWidget.FoodOrderTextStyle(),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Color(0xffef2b39),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        ds["Quantity"],
                                        style: AppWidget.BoldTextStyle(),
                                      ),
                                      SizedBox(width: 30),
                                      Icon(
                                        Icons.monetization_on_rounded,
                                        color: Color(0xffef2b39),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        ds["Total"],
                                        style: AppWidget.BoldTextStyle(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_2_rounded,
                                        color: Color(0xffef2b39),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        ds["Name"],
                                        style: AppWidget.SimpleTextStyle(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail_rounded,
                                        color: Color(0xffef2b39),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        ds["Email"],
                                        style: AppWidget.NewSimpleTextStyle(),
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    ds["Status"],
                                    style: TextStyle(
                                      color: Color(0xffef2b39),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () async {
                                      await DatabaseMethods().updateAdminOrder(
                                        ds.id,
                                      );
                                      await DatabaseMethods().updateUserOrder(
                                        ds["Id"],
                                        ds.id,
                                      );
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Delivered",
                                          style: AppWidget.NewWhiteTextStyle(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffef2b39),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 4.9),
                  Text("All Orders", style: AppWidget.HeadlineTextStyle()),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 21),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: allOrders(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
