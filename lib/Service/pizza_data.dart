import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];

  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese & Veg Pizza";
  pizzaModel.image = "assets/images/pizza1.png";
  pizzaModel.price = "50";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita Pizza";
  pizzaModel.image = "assets/images/pizza2.png";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "assets/images/pizza3.png";
  pizzaModel.price = "70";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "GodSpell Pizza";
  pizzaModel.image = "assets/images/pizza4.png";
  pizzaModel.price = "60";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  return pizza;
}
