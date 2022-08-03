import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/model/home_page_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/Cart Controller/cart_controller.dart';
import '../../../model/constant.dart';
import '../../widgets/NeumorphicCustomButton.dart';
import '../../widgets/appBar.dart';
import '../../widgets/items_card.dart';
import '../../widgets/search_text_field.dart';
import '../Cart/cart_ordering_page.dart';

class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder(
      builder: (CartController controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CustomAppBar(
                    title: "Foodi",
                    endWidget: NeumorphicCustomButton(
                      function: () {
                        Get.to(()=> CartOrderingPage());
                      },
                      child: Badge(
                        alignment: Alignment.bottomRight,
                        badgeColor: kPrimaryColor,
                        badgeContent:  Text(
                          controller.cartItems!.length.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        animationType: BadgeAnimationType.scale,
                        child: const Icon(
                          Icons.shopping_basket_outlined,
                          size: 20,
                          color: kunSelectedTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SearchTextField(),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 12),
                    child: SizedBox(
                      height: 40,
                      width: size.width,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: filterText.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return filterText[index];
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.35,
                    width: size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard(size: size,item: items[index],);
                      },
                    ),
                  ),

                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical:13.0,horizontal: 20),
                child: Text(
                  'Vegies',
                  style: kTitleStyle,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Neumorphic(
                    style: neumorphicUpContainerStyle.copyWith(lightSource: LightSource.topLeft),
                    child: Container(
                      color: kElementsColor,
                      height: size.height * 0.20,
                      width: size.width*0.85,
                      child: Center(
                        child: Container(
                          height: size.height * 0.18,
                          width: size.width*0.81,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all( Radius.circular(12)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end:Alignment.bottomRight ,
                              colors: colorsList,),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Find healthy vegitables",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),),
                                NeumorphicCustomButton(
                                  function: (){},
                                  isClickable: true,
                                  icon: Icons.bubble_chart,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },

    );
  }
}

