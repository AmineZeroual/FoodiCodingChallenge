import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/model/home_page_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/Cart Controller/cart_controller.dart';
import '../../../model/constant.dart';
import '../../widgets/NeumorphicCustomButton.dart';
import '../../widgets/appBar.dart';
import '../../widgets/cart_card.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/label_price.dart';

class CartOrderingPage extends StatelessWidget {
  CartOrderingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder(builder: (CartController controller) {
      return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            children: [
              CustomAppBar(
                title: "Cart",
                startWidget: NeumorphicCustomButton(
                  function: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                    color: kunSelectedTextColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              controller.cartItems!.isEmpty
                  ? const Center(
                child: Text(
                  "No Item For the moment",
                  style: kTitleStyle,
                ),)
                  : SizedBox(
                width: size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.cartItems!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CartCard(
                          item: controller.cartItems![index]!,
                          size: size),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomDivider(
                  height: 3,
                  width: size.width * 0.90,
                  thickness: 1.5,
                  color: kunSelectedTextColor),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LabelPrice(
                      title: "Subtotal",
                      price: controller.subTotal!,
                    ),
                    LabelPrice(title: "Discount", price: -controller.discount!),
                    LabelPrice(
                      title: "Total",
                      price: controller.total!,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                size: size,
                text: "Order now",
                function: () {
                  
                  //Todo finish ordering
                },
              ),
            ],
          ),
        ),
      ),
    ); },
    );
  }
}
