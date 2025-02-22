// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:foodgo/Service/database.dart';
// import 'package:foodgo/Service/shared_pref.dart';
// import 'package:foodgo/Service/widget_support.dart';

// class OrderPage extends StatefulWidget {
//   const OrderPage({super.key});

//   @override
//   State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   String? id;

//   getthesharedprefs() async {
//     id = await SharedpreferencesHelper().getUserId();
//     setState(() {});
//   }

//   getontheload() async {
//     await getthesharedprefs();
//     orderStream = await DatabaseMethods().getUserOrders(id!);
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getontheload();
//   }

//   Stream? orderStream;

//   Widget allOrders() {
//     return StreamBuilder(
//       stream: orderStream,
//       builder: (context, AsyncSnapshot snapshot) {
//         return snapshot.hasData
//             ? ListView.builder(
//               padding: EdgeInsets.zero,
//               itemCount: snapshot.data.docs.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot ds = snapshot.data.docs[index];
//                 return Container(
//                   margin: EdgeInsets.only(left: 20, right: 20),
//                   child: Material(
//                     elevation: 3,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                     ),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.location_on_rounded,
//                                 color: Color(0xffef2b39),
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 ds["Address"],
//                                 style: AppWidget.BoldTextStyle(),
//                               ),
//                             ],
//                           ),
//                           Divider(),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 ds["FoodImage"],
//                                 height: 120,
//                                 width: 120,
//                                 fit: BoxFit.contain,
//                               ),
//                               SizedBox(width: 20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     ds["FoodName"],
//                                     style: AppWidget.FoodOrderTextStyle(),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.shopping_cart,
//                                         color: Color(0xffef2b39),
//                                       ),
//                                       SizedBox(width: 10),
//                                       Text(
//                                         ds["Quantity"],
//                                         style: AppWidget.BoldTextStyle(),
//                                       ),
//                                       SizedBox(width: 30),
//                                       Icon(
//                                         Icons.monetization_on_rounded,
//                                         color: Color(0xffef2b39),
//                                       ),
//                                       SizedBox(width: 10),
//                                       Text(
//                                         ds["Total"],
//                                         style: AppWidget.BoldTextStyle(),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     ds["Status"],
//                                     style: TextStyle(
//                                       color: Color(0xffef2b39),
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             )
//             : Container();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 40),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [Text("Orders", style: AppWidget.HeadlineTextStyle())],
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Color(0xffececf8),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 21),
//                     Container(
//                       height: MediaQuery.of(context).size.height / 1.5,
//                       child: allOrders(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/Service/database.dart';
import 'package:foodgo/Service/shared_pref.dart';
import 'package:foodgo/Service/widget_support.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String? id;

  // Get the current user's id from shared preferences
  getthesharedprefs() async {
    id = await SharedpreferencesHelper().getUserId();
    setState(() {});
  }

  // Fetch orders stream for the user
  Future<Stream<QuerySnapshot>> getOrdersStream() async {
    if (id != null) {
      return await DatabaseMethods().getUserOrders(id!);
    }
    return Stream.empty(); // Return an empty stream if user ID is not available
  }

  @override
  void initState() {
    super.initState();
    getthesharedprefs();
  }

  // Widget to display all orders
  Widget allOrders() {
    return FutureBuilder<Stream<QuerySnapshot>>(
      future: getOrdersStream(),
      builder: (context, AsyncSnapshot<Stream<QuerySnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Show loading indicator while waiting
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          ); // Handle error
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No Orders Found')); // Handle empty data
        } else {
          return StreamBuilder<QuerySnapshot>(
            stream: snapshot.data, // Use the stream obtained from FutureBuilder
            builder: (context, AsyncSnapshot<QuerySnapshot> orderSnapshot) {
              if (orderSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (orderSnapshot.hasError) {
                return Center(child: Text('Error: ${orderSnapshot.error}'));
              } else if (!orderSnapshot.hasData ||
                  orderSnapshot.data!.docs.isEmpty) {
                return Center(child: Text('No Orders Found'));
              } else {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: orderSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = orderSnapshot.data!.docs[index];
                    return Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Text(
                                        ds["Status"],
                                        style: TextStyle(
                                          color: Color(0xffef2b39),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Orders", style: AppWidget.HeadlineTextStyle())],
            ),
            SizedBox(height: 10),
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
