import 'package:get/get.dart';

import '../../model/Item_model.dart';
import '../Cart Controller/cart_controller.dart';

class ItemController extends GetxController{
  CartController cartController = Get.find<CartController>();

  void addQuantity(Item item){
   item.quantity = item.quantity! + 1;
   cartController.calculateTotalCartPrices();
   update();
  }
  void minusQuantity(Item item){
    if(item.quantity!>1){
    item.quantity = item.quantity! - 1;
    cartController.calculateTotalCartPrices();
    update();
    }
  }
}