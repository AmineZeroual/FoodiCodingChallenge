import 'package:flutter/material.dart';
import 'package:foodi_coding_challenge/controller/Cart%20Controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/Items Controller/item_controller.dart';
import '../../model/Item_model.dart';
import '../../model/constant.dart';
import 'NeumorphicCustomButton.dart';

class AddMinusWidget extends StatelessWidget {
   AddMinusWidget({
    Key? key, this.item,
  }) : super(key: key);
 final Item? item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (ItemController controller) {
      return  Row(
        children: [
          NeumorphicCustomButton(
            function: () {
            controller.minusQuantity(item!);

            },
            isClickable: false,
            child: Icon(Icons.remove),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
           item!.quantity.toString(),
            style: kTitleStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 12,
          ),
          NeumorphicCustomButton(
            function: () {
              controller.addQuantity(item!);
              },
            isClickable: false,
            child: Icon(Icons.add),
          ),

        ],
      );
    },);
  }
}
