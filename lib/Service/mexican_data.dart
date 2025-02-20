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
      "A Cheese Burger features a juicy, seasoned patty topped with melted cheese, fresh lettuce, tomatoes, and pickles, all packed in a soft, toasted bun for a rich and savory bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Fresh Tacos";
  mexicanModel.image = "assets/images/fresh-tacos.png";
  mexicanModel.price = "1250";
  mexicanModel.desc =
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Burritos";
  mexicanModel.image = "assets/images/burritos.png";
  mexicanModel.price = "1150";
  mexicanModel.desc =
      "A Cheese Burger features a juicy, seasoned patty topped with melted cheese, fresh lettuce, tomatoes, and pickles, all packed in a soft, toasted bun for a rich and savory bite.";
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
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Tradition Mexican Food";
  mexicanModel.image = "assets/images/trad.png";
  mexicanModel.price = "1000";
  mexicanModel.desc =
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Noodles Grilled Mushrooms";
  mexicanModel.image = "assets/images/noodlesgrilledmushrooms.png";
  mexicanModel.price = "1250";
  mexicanModel.desc =
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  mexicanModel.name = "Yakitori";
  mexicanModel.image = "assets/images/yakitori.png";
  mexicanModel.price = "1250";
  mexicanModel.desc =
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  mexican.add(mexicanModel);
  mexicanModel = new MexicanModel();

  return mexican;
}
