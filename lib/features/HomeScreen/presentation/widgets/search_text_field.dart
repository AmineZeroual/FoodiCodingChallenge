import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../core/constant.dart';
import '../../../../core/widgets/NeumorphicCustomButton.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30.0, vertical: 10),
      child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(12)),
            color: kElementsColor,
            depth: -2.5,
            shadowLightColorEmboss: Colors.white,
            shadowDarkColorEmboss: const Color(0xffB0C3DB),
            intensity: 0.9,
          ),
          child: TextField(
            cursorHeight: 25,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              focusColor: kElementsColor,
              fillColor: kElementsColor,
              focusedBorder: InputBorder.none,
              enabledBorder:InputBorder.none ,
              prefixIcon: const Icon(
                Icons.search,
                color: kPrimaryColor,
                size: 25,
              ),
              hintText: "Search...",
              hintStyle: kHintStyle,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, top: 6, bottom: 6),
                child: NeumorphicCustomButton(
                  function: () {},
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    size: 20,
                    color: kunSelectedTextColor,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
