import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../view/pages/HomePage/favorite_screen.dart';
import '../view/pages/HomePage/main_screen.dart';
import '../view/pages/HomePage/profile_screen.dart';
import '../view/pages/HomePage/shopping_screen.dart';
import 'constant.dart';
import '../view/widgets/filter_items.dart';
import 'Item_model.dart';

List<IconData> bottomNavBarIcons = [
  Icons.house,
  Icons.shopping_cart,
  Icons.favorite,
  Icons.person,
];

List<Widget> bottomNavBarScreens = [
  const MainScreen(),
  ShoppingScreen(),
  const FavoritesScreen(),
  const ProfileScreen(),
];

List<FilterItem> filterText = [
  FilterItem(selected: true, title: "All"),
  FilterItem(selected: false, title: "Outdoor"),
  FilterItem(selected: false, title: "Indoor"),
  FilterItem(selected: false, title: "Big plants"),
  FilterItem(selected: false, title: "Little"),
  FilterItem(selected: false, title: "Meat"),
  FilterItem(selected: false, title: "Vegetables"),
];

List<Item> items = [
  Item("Milk", "Milk is a nutrient-rich liquid food produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals before they are able to digest solid food. Immune factors and immune-modulating components in milk contribute to milk immunity.Milk is a nutrient-rich liquid food produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals before they are able to digest solid food. Immune factors and immune-modulating components in milk contribute to milk immunity.Milk is a nutrient-rich liquid food produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals before they are able to digest solid food. Immune factors and immune-modulating components in milk contribute to milk immunity.Milk is a nutrient-rich liquid food produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals before they are able to digest solid food. Immune factors and immune-modulating components in milk contribute to milk immunity."
      , "Indoor", 1.15, 1,"assets/images/milk.png"),
  Item("Butter", "Butter is a dairy product made from the fat and protein components of churned cream. It is a semi-solid emulsion at room temperature, consisting of approximately 80% butterfat",
      "Indoor", 0.80, 1,"assets/images/butter.png"),
  Item("Bread", "Bread is a staple food prepared from a dough of flour and water, usually by baking. Throughout recorded history and around the world, it has been an important part of many cultures' diet",
      "Outdoor", 1.00, 1,"assets/images/bread.png"),
  Item("Skimmed Milk", "Skimmed milk, or skim milk, is made when all the milkfat is removed from whole milk. It tends to contain around 0.1% fat",
      "Indoor", 1.15, 1,"assets/images/Skimmed_milk.png"),
];

List<Color> colorsList = [
kunSelectedTextColor,
kunSelectedTextColor.withOpacity(0.7),
kElementsColor,
kunSelectedTextColor,
kunSelectedTextColor.withOpacity(0.7),
kElementsColor,
kunSelectedTextColor,
kunSelectedTextColor.withOpacity(0.7),
kElementsColor,
kunSelectedTextColor,
kunSelectedTextColor.withOpacity(0.7),
kElementsColor,
kunSelectedTextColor,
kunSelectedTextColor.withOpacity(0.7),
kElementsColor,
];