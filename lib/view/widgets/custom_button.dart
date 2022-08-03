import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../model/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size, this.text, required this.function,
  }) : super(key: key);

  final Size size;
  final String? text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: function,
      child: Neumorphic(
        style: neumorphicButtonStyle!.copyWith(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
        ),
        child: SizedBox(
          height: 50,
          width: size.width*0.40,
          child:  Center(
            child: Text(
              text!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
    );
  }
}
