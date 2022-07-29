import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foodi_coding_challenge/features/HomeScreen/data/home_page_constant.dart';

import '../../../../core/constant.dart';
import '../../../../core/widgets/NeumorphicCustomButton.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../data/Item_model.dart';
import '../widgets/items_card.dart';
import '../widgets/search_text_field.dart';

class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          children: [
            CustomAppBar(
              title: "Foodi",
              endWidget: NeumorphicCustomButton(
                function: () {},
                child: Badge(
                  alignment: Alignment.bottomRight,
                  badgeColor: kPrimaryColor,
                  badgeContent: const Text(
                    "3",
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
      ],
    );
  }
}

