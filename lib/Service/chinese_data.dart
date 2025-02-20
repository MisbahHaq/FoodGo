import 'package:flutter/foundation.dart';
import 'package:foodgo/Model/burger_model.dart';
import 'package:foodgo/Model/chinese_model.dart';
import 'package:foodgo/Model/pizza_model.dart';

List<ChineseModel> getChinese() {
  List<ChineseModel> chinese = [];

  ChineseModel chineseModel = new ChineseModel();

  chineseModel.name = "Braised Beef Noodles";
  chineseModel.image = "assets/images/braised beef noodles.png";
  chineseModel.price = "850";
  chineseModel.desc =
      "A Cheese Burger features a juicy, seasoned patty topped with melted cheese, fresh lettuce, tomatoes, and pickles, all packed in a soft, toasted bun for a rich and savory bite.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Caramelized Noodles";
  chineseModel.image = "assets/images/caramelized.png";
  chineseModel.price = "550";
  chineseModel.desc =
      "Sweet and savory noodles stir-fried to perfection with a rich caramelized sauce, creating a deliciously glossy and flavorful dish. The perfect mix of tender noodles and a hint of sweetness, garnished with fresh herbs or veggies.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Ceviche";
  chineseModel.image = "assets/images/ceviche-.png";
  chineseModel.price = "550";
  chineseModel.desc =
      "Fresh fish or seafood marinated in zesty lime juice, mixed with vibrant tomatoes, onions, cilantro, and a touch of chili. A refreshing and tangy dish, perfect as a light appetizer or a refreshing snack.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Chili Bean Noodles";
  chineseModel.image = "assets/images/chilibeans.png";
  chineseModel.price = "650";
  chineseModel.desc =
      "Noodles tossed in a savory, spicy chili bean sauce, combining rich umami flavors with a bold kick of heat. Topped with fresh herbs and vegetables, this dish offers a satisfying blend of textures and bold, tangy spice.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Chili Beans Noodles Shredded";
  chineseModel.image = "assets/images/chilibeansshredded.png";
  chineseModel.price = "450";
  chineseModel.desc =
      "Soft noodles topped with tender shredded chili beans, coated in a rich, spicy sauce. The bold flavors of chili and beans combine perfectly with the noodles, creating a hearty and flavorful dish with a satisfying heat.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Instant Noodles";
  chineseModel.image = "assets/images/chin.png";
  chineseModel.price = "450";
  chineseModel.desc =
      "Quick and convenient, these noodles are packed with flavor in every bite. Simply add hot water and enjoy the savory broth and perfectly cooked noodles, ready in minutes for a satisfying meal or snack.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Chinese Beef Noodles";
  chineseModel.image = "assets/images/chinesenoodles.png";
  chineseModel.price = "950";
  chineseModel.desc =
      "Tender beef slices simmered in a savory broth, served with chewy noodles and topped with fresh vegetables and herbs. A comforting, flavorful dish that perfectly balances rich, hearty flavors with a hint of spice.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Gyoza Dumplings";
  chineseModel.image = "assets/images/gyoza-dumplings-.png";
  chineseModel.price = "750";
  chineseModel.desc =
      "Crispy on the bottom and tender on top, these Japanese dumplings are filled with seasoned ground meat and vegetables. Served with a savory dipping sauce, they offer a perfect balance of texture and flavor in every bite.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Grilled Mushroom Noodles";
  chineseModel.image = "assets/images/noodlesgrilledmushrooms.png";
  chineseModel.price = "650";
  chineseModel.desc =
      "Savory grilled mushrooms paired with tender noodles, tossed in a rich, umami-packed sauce. A hearty, flavorful dish that combines smoky, earthy mushrooms with the satisfying texture of noodles.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Sichuan";
  chineseModel.image = "assets/images/sichuan.png";
  chineseModel.price = "950";
  chineseModel.desc =
      "A bold and flavorful Chinese cuisine known for its use of spicy, tangy, and aromatic ingredients, particularly Sichuan peppercorns. Dishes are packed with heat, umami, and distinctive flavors, often featuring stir-fries, braises, and soups with a perfect balance of spice, garlic, and bold seasonings.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Spicy Dan Dan Noodles";
  chineseModel.image = "assets/images/spicy dan dan.png";
  chineseModel.price = "450";
  chineseModel.desc =
      "A savory and spicy Sichuan dish featuring noodles in a rich, flavorful sauce made with chili oil, garlic, and sesame paste. Topped with minced meat and scallions, these noodles deliver a perfect balance of heat, nuttiness, and umami in every bite.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Rice Noodles with Kimchi";
  chineseModel.image = "assets/images/kimchi.png";
  chineseModel.price = "450";
  chineseModel.desc =
      "Soft rice noodles stir-fried with tangy, spicy kimchi and vegetables, creating a bold fusion of flavors. The fermented kimchi adds a unique kick, while the noodles provide a satisfying, tender base for this savory dish.";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  return chinese;
}
