import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../model/constant.dart';
import '../../../../model/Item_model.dart';
import '../../controller/Cart Controller/cart_controller.dart';
import '../pages/ItemDetails/details_page.dart';
import 'NeumorphicCustomButton.dart';

class ItemCard extends StatefulWidget {
   ItemCard({
    Key? key,
    required this.size, required this.item,
  }) : super(key: key);

  final Size size;
  final Item item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  CartController? controller ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  controller = Get.find<CartController>();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO implement Navigation to Details screen
        Get.to(()=> DetailsPage(item: widget.item,));
      },
      child: Container(
        color: kBackGroundColor,
        height: widget.size.height * 0.33,
        width: widget.size.width*0.55,
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
                    height: widget.size.height * 0.32,
                    width: widget.size.width * 0.48,
                  ),
                ),
              ),
              Positioned(
                top: -9,
                right: -8,
                child: Image.asset(
                  widget.item.image!,
                  height: widget.size.height * 0.23,
                  width: widget.size.width * 0.55,
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
                        widget.item.type!,
                        style: kSubTitleStyle,
                      ),

                      Text(
                        widget.item.name!,
                        style: kTitleStyle.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: widget.size.width*0.42,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "£${widget.item.unitPrice}",
                              style: kTitleStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            ),
                            NeumorphicCustomButton(
                              function: () {
                                if(widget.item.isInCart.value){
                                  controller!.addToCart(widget.item);
                                }else{
                                  controller!.removeFromCart(widget.item);

                                }

                                //TODO implement "Add to Cart Features"
                              },
                              isOnCart: widget.item.isInCart,
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
