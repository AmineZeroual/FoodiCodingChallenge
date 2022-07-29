import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/features/HomeScreen/presentation/pages/favorite_screen.dart';
import 'package:foodi_coding_challenge/features/HomeScreen/presentation/pages/main_screen.dart';
import 'package:foodi_coding_challenge/features/HomeScreen/presentation/pages/profile_screen.dart';
import '../presentation/pages/shopping_screen.dart';
import '../presentation/widgets/filter_items.dart';
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
  Item("Milk", "", "Indoor", 1.50, 1,"assets/images/milk.png"),
  Item("Butter", "", "Indoor", 0.80, 1,"assets/images/butter.png"),
  Item("Bread", "", "Outdoor", 1.00, 1,"assets/images/bread.png"),
  Item("Skimmed Milk", "", "Indoor", 1.15, 1,"assets/images/Skimmed_milk.png"),
];
