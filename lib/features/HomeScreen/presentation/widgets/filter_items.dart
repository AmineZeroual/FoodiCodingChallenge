import 'package:flutter/material.dart';

import '../../../../core/constant.dart';
import '../../../../core/widgets/custom_divider.dart';


class FilterItem extends StatefulWidget {
  FilterItem({
    Key? key,
    required this.selected, required this.title,
  }) : super(key: key);

  bool selected;
  final String title;


  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.selected =!widget.selected;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: kSubTitleStyle.copyWith(
              color: widget.selected ?kPrimaryColor:Colors.blueGrey[300],
            )
          ),
          const SizedBox(
            height: 2,
          ),

          widget.selected?const CustomDivider(
            height:5,
            thickness:2,
            width: 20,
            color: kPrimaryColor,
          ):const SizedBox(),
        ],
      ),
    );
  }
}
