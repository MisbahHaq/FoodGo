import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/burger_model.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];

  BurgerModel burgerModel = new BurgerModel();

  burgerModel.name = "Cheese Burger";
  burgerModel.image = "assets/images/burger1.png";
  burgerModel.price = "50";
  burgerModel.desc = "";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Pizza";
  burgerModel.image = "assets/images/burger2.png";
  burgerModel.price = "80";
  burgerModel.desc = "";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Cheese Burger";
  burgerModel.image = "assets/images/burger1.png";
  burgerModel.price = "50";
  burgerModel.desc = "";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Pizza";
  burgerModel.image = "assets/images/burger2.png";
  burgerModel.price = "80";
  burgerModel.desc = "";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  return burger;
}
