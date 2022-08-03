import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/controller/Items%20Controller/item_controller.dart';
import 'package:get/get.dart';
import '../../model/constant.dart';
import '../../model/Item_model.dart';
import 'add_minus_widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.size, required this.item,
  }) : super(key: key);

  final Size size;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: neumorphicUpContainerStyle,
      child: Container(
        color: kElementsColor,
        height: size.height * 0.15,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Row(
            children: [
              Image.asset(
                item.image!,
                height: size.height * 0.14,
                width: size.width * 0.30,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name!,
                    style: kTitleStyle.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GetBuilder(builder: (ItemController controller) {
                    return  AddMinusWidget(item:item);
                  },),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: item.isDiscounted,
                      child:Text(
                      item.discount!.toString(),
                      style: kSubTitleStyle.copyWith(
                        color: kDiscountColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    ),
                    Text(
                      "£${item.totalPrice.toString()}",
                      style: kSubTitleStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

