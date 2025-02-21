import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/burger_model.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];

  BurgerModel burgerModel = new BurgerModel();

  burgerModel.name = "Cheese Burger";
  burgerModel.image = "assets/images/burger1.png";
  burgerModel.price = "550";
  burgerModel.desc =
      "A Cheese Burger features a juicy, seasoned patty topped with melted cheese, fresh lettuce, tomatoes, and pickles, all packed in a soft, toasted bun for a rich and savory bite.";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Burger";
  burgerModel.image = "assets/images/burger2.png";
  burgerModel.price = "450";
  burgerModel.desc =
      "A Veggie Burger features a flavorful, plant-based patty made from vegetables, grains, or legumes, topped with fresh lettuce, tomatoes, and pickles, all nestled in a soft, toasted bun for a satisfying, meat-free bite.";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  //   burgerModel.name = "Beef Burger";
  //   burgerModel.image = "assets/images/beef burger.png";
  //   burgerModel.price = "550";
  //   burgerModel.desc =
  //       "A juicy, seasoned patty is the star of this burger, paired with fresh toppings like lettuce, tomatoes, onions, and pickles, all nestled in a soft, toasted bun for a rich and satisfying bite. Perfect for those craving a hearty, savory meal.";
  //   burger.add(burgerModel);
  //   burgerModel = new BurgerModel();

  burgerModel.name = "Veggie Pizza";
  burgerModel.image = "assets/images/burger2.png";
  burgerModel.price = "450";
  burgerModel.desc =
      "Veggie Pizza features a crispy crust topped with rich tomato sauce, melted cheese, and a colorful mix of fresh vegetables for a flavorful and wholesome bite.";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  return burger;
}
