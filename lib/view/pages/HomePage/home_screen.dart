import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/model/constant.dart';
import 'package:badges/badges.dart';
import 'package:foodi_coding_challenge/view/widgets/custom_buttom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/Cart Controller/cart_controller.dart';
import '../../../model/home_page_constant.dart';
import '../Cart/cart_ordering_page.dart';

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
    return GetBuilder(
      builder: (CartController controller) {
        return Scaffold(
          floatingActionButton: Neumorphic(
            style: neumorphicButtonStyle,
            child: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Get.to(() => CartOrderingPage());
              },
              child: Badge(
                alignment: Alignment.bottomRight,
                badgeColor: Colors.white,
                badgeContent: Text(
                  controller.cartItems!.length.toString(),
                  style: const TextStyle(
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomNavBarBar(
            index: _bottomNavIndex,
            tapIndex: (index) => setState(() => _bottomNavIndex = index),
          ),
          //we didn't use the app bar because with it we can't change the size of the button
          backgroundColor: kBackGroundColor,
          body: SafeArea(
            child: bottomNavBarScreens[_bottomNavIndex],
          ),
        );
      },
    );
  }
}
