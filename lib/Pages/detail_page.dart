import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foodgo/Service/database.dart';
import 'package:foodgo/Service/keys.dart';
import 'package:foodgo/Service/shared_pref.dart';
import 'package:foodgo/Service/widget_support.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController addresscontroller = new TextEditingController();
  Map<String, dynamic>? paymentIntent;
  String? name, id, email, address;
  int quantity = 1, totalprice = 0;

  getthesharedpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString(SharedpreferencesHelper.userNameKey);
    id = prefs.getString(SharedpreferencesHelper.userIdKey);
    email = prefs.getString(SharedpreferencesHelper.userEmailKey);
    address = prefs.getString(SharedpreferencesHelper.userAddressKey);

    if (name == null || id == null || email == null) {
      print("Error: User data not found in SharedPreferences.");
    }

    setState(() {});
  }

  @override
  void initState() {
    totalprice = int.parse(widget.price!);
    getthesharedpref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
              Text("Rs " + widget.price!, style: AppWidget.PriceTextStyle()),
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
                  Text(
                    quantity.toString(),
                    style: AppWidget.HeadlineTextStyle(),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        quantity = quantity - 1;
                        totalprice = totalprice - int.parse(widget.price!);
                        setState(() {});
                      }
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
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 30,
                        ),
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
                          "Rs " + totalprice.toString(),
                          style: AppWidget.BoldWhiteTextStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      print("Checking address...");
                      if (address == null) {
                        print("No address found, opening address box...");
                        openBox();
                      } else {
                        print("Address exists: $address");
                        print("Order Now pressed, proceeding to payment...");
                        makePayment(totalprice.toString());
                      }
                    },
                    child: Material(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  calculateAmount(String amount) {
    return (double.parse(amount) * 100).toStringAsFixed(0);
  }

  Future openBox() => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxHeight: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel),
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Add the Address",
                        style: TextStyle(
                          color: Color(0xff008080),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Address",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      print("Saving address: ${addresscontroller.text}");
                      await SharedpreferencesHelper().saveUserAddress(
                        addresscontroller.text,
                      );
                      setState(() {
                        address = addresscontroller.text;
                      });
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xff008080),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );

  Future<void> makePayment(String amount) async {
    try {
      print("Creating payment intent...");
      paymentIntent = await createPaymentIntent(amount, 'pkr');
      print("Payment Intent created: $paymentIntent");

      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent?['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: "Misbah",
            ),
          )
          .then((value) {});

      displayPaymentSheet(amount);
    } catch (e) {
      print('Error creating payment sheet: $e');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) async {
            String orderId = randomAlphaNumeric(10);
            print("Payment Successful, Order ID: $orderId");

            Map<String, dynamic> userOrderMap = {
              "Name": name,
              "Id": id,
              "Quantity": quantity.toString(),
              "Total": totalprice.toString(),
              "Email": email,
              "FoodName": widget.name,
              "FoodImage": widget.image,
              "OrderId": orderId,
              "Status": "Pending",
              "Address": address == null ? addresscontroller.text : address,
            };

            await DatabaseMethods().addUserOrderDetails(
              userOrderMap,
              id!,
              orderId,
            );

            await DatabaseMethods().addAdminOrderDetails(userOrderMap, orderId);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Order Placed Successfully!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            );

            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                            ),
                            Text("Payment Successful"),
                          ],
                        ),
                      ],
                    ),
                  ),
            );
            paymentIntent = null;
          })
          .onError((error, StackTrace) {
            print("Error is: $error $StackTrace");
          });
    } on StripeException catch (e) {
      print("Stripe Error is: $e");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(content: Text("Payment cancelled")),
      );
    } catch (e) {
      print("Error is: $e");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          'Authorization': 'Bearer $secretkey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      print("Payment Intent Response: ${response.body}");
      return jsonDecode(response.body);
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }
}
