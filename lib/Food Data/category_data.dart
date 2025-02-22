import 'package:foodgo/Model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name = "Pizza";
  categoryModel.image = "assets/images/pizza.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "Burger";
  categoryModel.image = "assets/images/burger.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "chinese";
  categoryModel.image = "assets/images/chinese.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "Mexican";
  categoryModel.image = "assets/images/tacos.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
