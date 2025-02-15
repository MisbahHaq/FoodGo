import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];

  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese & Veg Pizza";
  pizzaModel.image = "assets/images/pizza1.jpg";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Margherita Pizza";
  pizzaModel.image = "assets/images/pizza2.jpg";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "assets/images/pizza3.jpg";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name = "GodSpell Pizza";
  pizzaModel.image = "assets/images/pizza4.jpg";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  return pizza;
}
