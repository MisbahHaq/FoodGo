import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget {
  static TextStyle HeadlineTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static TextStyle SimpleTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle NewSimpleTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle FoodOrderTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle WhiteTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle NewWhiteTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle BoldTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle PriceTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: const Color.fromARGB(174, 0, 0, 0),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle NewPriceTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: const Color.fromARGB(174, 0, 0, 0),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle BoldWhiteTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle SignUpTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: const Color.fromARGB(174, 0, 0, 0),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
