import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constant.dart';


class NeumorphicCustomButton extends StatefulWidget {
 const NeumorphicCustomButton({Key? key,  this.child, this.isClickable=false, required this.function,  this.icon}) : super(key: key);
 final Widget? child;
 final bool isClickable;
 final IconData? icon;
 final Function()? function;
  @override
  _NeumorphicCustomButtonState createState() => _NeumorphicCustomButtonState();
}

class _NeumorphicCustomButtonState extends State<NeumorphicCustomButton> {
  bool changeShape = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isClickable?() {
        setState(() {
          changeShape = !changeShape;
          widget.function;
        });
      }:widget.function,
      child: Neumorphic(
        duration: const Duration(milliseconds: 250),
        style: NeumorphicStyle(
          color: changeShape ? kSecondaryColor : kElementsColor,
          depth: changeShape ? -3 : 3,
          intensity: 0.90,
          surfaceIntensity: 0.6,
          shape: NeumorphicShape.flat,
          lightSource: LightSource.topLeft,
          boxShape: NeumorphicBoxShape.roundRect(
             const BorderRadius.all( Radius.circular(12))),
        ),
        padding: const EdgeInsets.all(9),
        child: widget.isClickable?Icon(
          widget.icon,
          size: 20,
          color: changeShape ? Colors.white : kPrimaryColor,
        ):widget.child,
      ),
    )
    ;
  }
}
