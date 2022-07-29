import 'package:flutter/material.dart';
class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key, required this.height, required this.width, required this.thickness, required this.color}) : super(key: key);
   final double height,width,thickness;
   final Color color;
   @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child:  Center(
        child:  Container(
          width:width ,
          margin:  const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height:thickness,
          color: color,
        ),
      ),
    );
  }
}
