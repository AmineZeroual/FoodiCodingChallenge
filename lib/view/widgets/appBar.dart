import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:foodi_coding_challenge/model/constant.dart';

import 'NeumorphicCustomButton.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? startWidget, endWidget;

  const CustomAppBar(
      {Key? key, required this.title, this.startWidget, this.endWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          startWidget == null ? const SizedBox(width: 30,):startWidget!,
          const Spacer(),
          Text(
            title,
            style: kTitleStyle,
          ),
          const Spacer(),
          endWidget == null ? const SizedBox(width: 30,):endWidget!,
        ],
      ),
    );
  }

}
