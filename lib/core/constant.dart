import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

const Color kPrimaryColor = Color(0xff37B5AC);
const Color kSecondaryColor = Color(0xff39DBC3);
const Color kBackGroundColor = Color(0xffE7EFF9);
const Color kElementsColor = Color(0xffE1EAF2);
const Color kTextColor = Color(0xff2D2D2D);
const Color kDiscountColor = Color(0xffAD4825);
const Color kunSelectedTextColor = Color(0xffC9D6E0);
const double kHorizontalPadding = 12, kVerticalPadding = 12;

const kTitleStyle =  TextStyle(
  fontSize: 24,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w800,
  color: kTextColor,
);
const kHintStyle =  TextStyle(
  color: kunSelectedTextColor,
  fontSize: 18,
  fontWeight: FontWeight.w500,
  fontFamily: "Roboto"
);
TextStyle kSubTitleStyle =  TextStyle(
  color: Colors.blueGrey[300],
  fontSize: 16,
  fontWeight: FontWeight.w600,
);


NeumorphicStyle neumorphicUpContainerStyle =  NeumorphicStyle(
  color: kElementsColor,
  depth: 3,
  intensity: 0.90,
  surfaceIntensity: 0.6,
  shape: NeumorphicShape.flat,
  lightSource: LightSource.topLeft,
  boxShape:  NeumorphicBoxShape.roundRect(
      const   BorderRadius.all(   Radius.circular(12))),
);
