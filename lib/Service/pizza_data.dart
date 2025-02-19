import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];

  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese & Veg Pizza";
  pizzaModel.image = "assets/images/pizza1.png";
  pizzaModel.price = "990";
  pizzaModel.desc =
      "Cheese & Veg Pizza features a crispy crust topped with rich tomato sauce, gooey mozzarella cheese, and a medley of fresh veggies for a flavorful and satisfying bite.";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita Pizza";
  pizzaModel.image = "assets/images/pizza2.png";
  pizzaModel.price = "1100";
  pizzaModel.desc =
      "Margherita Pizza features a thin, crispy crust topped with rich tomato sauce, fresh mozzarella, and fragrant basil, creating a simple yet delicious balance of flavors.";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "assets/images/pizza3.png";
  pizzaModel.price = "1000";
  pizzaModel.desc =
      "Cheese Pizza features a crispy crust, rich tomato sauce, and gooey melted mozzarella for a classic, savory, and satisfying taste.";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "GodSpell Pizza";
  pizzaModel.image = "assets/images/pizza4.png";
  pizzaModel.price = "1100";
  pizzaModel.desc =
      "GodSpell Pizza features a crispy crust, rich tomato sauce, gooey melted cheese, and a spicy kick from bold seasonings, creating a perfect balance of heat and creaminess.";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  return pizza;
}
