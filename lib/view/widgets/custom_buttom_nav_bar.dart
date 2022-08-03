import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../model/constant.dart';
import '../../model/home_page_constant.dart';


class CustomBottomNavBarBar extends StatelessWidget {
  const CustomBottomNavBarBar ({Key? key, required this.tapIndex, required this.index}) : super(key: key);
  final Function(int) tapIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: kPrimaryColor,
      blurEffect: true,
      borderColor: kunSelectedTextColor,
      notchMargin: 10,
      height: 80,
      shadow: const Shadow(
          color: kunSelectedTextColor,
          blurRadius: 10,
          offset: Offset(-5, -5)),
      inactiveColor: kunSelectedTextColor,
      icons: bottomNavBarIcons,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      backgroundColor: kElementsColor,
      activeIndex: index,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: tapIndex,
      //other params
    );
  }
}
