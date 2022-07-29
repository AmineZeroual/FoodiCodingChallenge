import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../core/constant.dart';
import '../../../../core/widgets/NeumorphicCustomButton.dart';
import '../../data/Item_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.size, required this.item,
  }) : super(key: key);

  final Size size;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO implement Navigation to Details screen
      },
      child: Container(
        color: kBackGroundColor,
        height: size.height * 0.33,
        width: size.width*0.55,
        child: Center(
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Neumorphic(
                  style: neumorphicUpContainerStyle,
                  child: Container(
                    color: kElementsColor,
                    height: size.height * 0.32,
                    width: size.width * 0.48,
                  ),
                ),
              ),
              Positioned(
                top: -9,
                right: -8,
                child: Image.asset(
                  item.image!,
                  height: size.height * 0.23,
                  width: size.width * 0.55,
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.type!,
                        style: kSubTitleStyle,
                      ),

                      Text(
                        item.name!,
                        style: kTitleStyle.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: size.width*0.42,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "£${item.unitPrice!}",
                              style: kTitleStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                            NeumorphicCustomButton(
                              function: () {
                                //TODO implement "Add to Cart Features"
                              },
                              isClickable: true,
                              icon: Icons.add_shopping_cart,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
