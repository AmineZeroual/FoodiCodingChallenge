import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/core/constant.dart';
import 'package:foodi_coding_challenge/core/widgets/appBar.dart';
import 'package:badges/badges.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:foodi_coding_challenge/features/HomeScreen/presentation/widgets/custom_buttom_nav_bar.dart';

import '../../../../core/widgets/NeumorphicCustomButton.dart';
import '../../data/home_page_constant.dart';
import '../widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool changeShape = false;
  int _bottomNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Neumorphic(
        style: const NeumorphicStyle(
          color: kPrimaryColor,
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.circle(),
          depth: 3,
          intensity: 0.9,
          shadowLightColor: Colors.white,
          shadowDarkColor: Colors.blueGrey,
        ),
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {},
          child: Badge(
            alignment: Alignment.bottomRight,
            badgeColor: Colors.white,
            badgeContent: const Text(
              "3",
              style: TextStyle(
                  color: kPrimaryColor, fontSize: 10, fontFamily: "Roboto"),
            ),
            animationType: BadgeAnimationType.scale,
            child: const Icon(
              Icons.shopping_basket_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBarBar(
        index: _bottomNavIndex,
        tapIndex: (index) => setState(() => _bottomNavIndex = index),
      ),
      //we didn't use the app bar because with it we can't change the size of the button
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child:bottomNavBarScreens[_bottomNavIndex] ,
      ),
    );
  }
}
