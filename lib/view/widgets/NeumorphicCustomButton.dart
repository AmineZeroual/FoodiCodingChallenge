import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/controller/Cart%20Controller/cart_controller.dart';
import 'package:foodi_coding_challenge/controller/Items%20Controller/item_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../model/constant.dart';


class NeumorphicCustomButton extends StatefulWidget {
  NeumorphicCustomButton({Key? key,  this.isOnCart,this.child, this.isClickable=false, required this.function,  this.icon}) : super(key: key);
 final Widget? child;
 final bool isClickable;
 ValueNotifier<bool>? isOnCart;
 final IconData? icon;
 final Function()? function;
  @override
  _NeumorphicCustomButtonState createState() => _NeumorphicCustomButtonState();
}

class _NeumorphicCustomButtonState extends State<NeumorphicCustomButton> {
  bool changeShape = false;
  ItemController controller = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      //to make a reusable component we use the "isClickable" variable to
      // determinate if the button have inner shadow or not
      onPressed:widget.isClickable?(){
        setState(() {
        changeShape = !changeShape;
        widget.isOnCart!.value=changeShape;
        widget.function!.call();
      });}
      : (){
        setState(() {
          widget.function!.call();
        });},
      pressed: true,
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
        color: changeShape? Colors.white : kPrimaryColor,
      ):widget.child,
    )
    ;
  }
}
