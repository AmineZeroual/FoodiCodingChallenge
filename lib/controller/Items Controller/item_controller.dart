import 'package:get/get.dart';

import '../../model/Item_model.dart';
import '../Cart Controller/cart_controller.dart';

class ItemController extends GetxController{
  CartController cartController = Get.find<CartController>();

  void addQuantity(Item item){
    //increment the quantity of the item then calculate the total price of the cart
   item.quantity = item.quantity! + 1;
   cartController.calculateTotalCartPrices();
   update();
  }
  void minusQuantity(Item item){
    //a condition to avoid negative quantity
    if(item.quantity!>1){
      //decrement the quantity of the item then calculate the total price of the cart
      item.quantity = item.quantity! - 1;
    cartController.calculateTotalCartPrices();
    update();
    }
  }
}