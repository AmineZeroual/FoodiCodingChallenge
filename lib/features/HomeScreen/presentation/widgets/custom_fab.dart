import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../core/constant.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({Key? key, required this.function}) : super(key: key);
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
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
        onPressed: function,
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
    );
  }
}
