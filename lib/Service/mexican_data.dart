import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/burger_model.dart';
import 'package:foodgo/Model/chinese_model.dart';
import 'package:foodgo/Model/mexican_model.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<MexicanModel> getMexican() {
  List<MexicanModel> mexican = [];

  MexicanModel mexicanModel = new MexicanModel();

  mexicanModel.name = "Chilaquiles";
  mexicanModel.image = "assets/images/chilaquiles.png";
  mexicanModel.price = "850";
  mexicanModel.desc =
      "Crispy tortilla chips simmered in red or green sauce, topped with cheese, crema, a fried egg, and garnished with cilantro and onions. A delicious, savory Mexican breakfast dish full of flavor and texture.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Fresh Tacos";
  mexicanModel.image = "assets/images/fresh-tacos.png";
  mexicanModel.price = "1250";
  mexicanModel.desc =
      "Soft corn tortillas filled with your choice of seasoned meat, topped with fresh salsa, cilantro, onions, and a squeeze of lime. A simple, vibrant, and satisfying Mexican classic.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Burritos";
  mexicanModel.image = "assets/images/burritos.png";
  mexicanModel.price = "1150";
  mexicanModel.desc =
      "Flour tortillas wrapped around a hearty filling of seasoned meat, beans, rice, cheese, and fresh toppings. A flavorful and filling Mexican favorite, perfect for on-the-go or a satisfying meal.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Huevos Rancheros";
  mexicanModel.image = "assets/images/huevos.png";
  mexicanModel.price = "450";
  mexicanModel.desc =
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Tacos with Beef Lettuce Cheese";
  mexicanModel.image = "assets/images/salsa.png";
  mexicanModel.price = "1000";
  mexicanModel.desc =
      "Fried eggs served on warm corn tortillas, topped with a zesty tomato-based salsa, and garnished with fresh cilantro, onions, and cheese. A classic, hearty Mexican breakfast bursting with flavor.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Tradition Mexican Food";
  mexicanModel.image = "assets/images/trad.png";
  mexicanModel.price = "1000";
  mexicanModel.desc =
      "A vibrant blend of bold flavors and fresh ingredients, featuring dishes like tacos, tamales, enchiladas, and salsas. Rich in history and culture, each dish is crafted with a perfect balance of spices, herbs, and textures, offering a true taste of Mexico's culinary heritage.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "LOADED SRIRACHA FRIES";
  mexicanModel.image = "assets/images/SRIRACHA.png";
  mexicanModel.price = "370";
  mexicanModel.desc =
      "French Fries Loaded with Sriracha Mayo, Jalapeños, Salsa Verde, Cherry Tomatoes, Parmesan Shavings & a Dash of Truffle Oil";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Yakitori";
  mexicanModel.image = "assets/images/yakisoba.png";
  mexicanModel.price = "1250";
  mexicanModel.desc =
      "Grilled skewered chicken, marinated in a savory tare sauce, with a perfect balance of sweet and salty flavors. Often served with scallions or vegetables, this Japanese street food is tender, smoky, and delicious.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  return mexican;
}
