

import 'package:foodi_coding_challenge/controller/Cart%20Controller/cart_controller.dart';
import 'package:foodi_coding_challenge/controller/Items%20Controller/item_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DataBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(()=> CartController());
    Get.lazyPut<ItemController>(()=> ItemController());

  }

}