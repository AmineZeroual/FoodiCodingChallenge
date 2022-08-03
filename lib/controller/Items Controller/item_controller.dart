import 'package:get/get.dart';

import '../../model/Item_model.dart';

class ItemController extends GetxController{


  void addQuantity(Item item){
   item.quantity = item.quantity! + 1;
   update();
  }
  void minusQuantity(Item item){
    if(item.quantity!>1){
    item.quantity = item.quantity! - 1;
    update();
    }
  }
}