import 'package:flutter/material.dart';

import '../../../../model/constant.dart';


class LabelPrice extends StatelessWidget {
  const LabelPrice({
    Key? key, required this.title, required this.price,
  }) : super(key: key);
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: kSubTitleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "£$price",
          style: kTitleStyle.copyWith(fontSize: 22),
        ),

      ],
    );
  }
}