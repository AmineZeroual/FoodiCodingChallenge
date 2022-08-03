import 'package:flutter/material.dart';
import 'package:foodi_coding_challenge/model/constant.dart';
import 'package:foodi_coding_challenge/view/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/Item_model.dart';
import '../../widgets/NeumorphicCustomButton.dart';
import '../../widgets/add_minus_widget.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 90,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 20,
              color: kunSelectedTextColor.withOpacity(0.6),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               AddMinusWidget(item: item,),

              CustomButton(size: size, function: (){},text: "View cart"),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.40,
                width: size.width,
                decoration: BoxDecoration(
                    color: kBackGroundColor,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        kunSelectedTextColor,
                        kunSelectedTextColor.withOpacity(0.9),
                        kunSelectedTextColor.withOpacity(0.8),
                        kunSelectedTextColor.withOpacity(0.7),
                        kunSelectedTextColor.withOpacity(0.6),
                        kBackGroundColor
                      ],
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(size.width, 230),
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      right: 30,
                      top: 20,
                      bottom: 20,
                      child: Image.asset(
                        item.image!,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: NeumorphicCustomButton(
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
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name!,
                      style: kTitleStyle,
                    ),
                    Text(
                      "£${item.unitPrice!}",
                      style: kTitleStyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                item.description!,
                maxLines: 100,
                style: kSubTitleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
