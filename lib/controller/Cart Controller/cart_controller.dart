import 'dart:math';

import 'package:foodi_coding_challenge/model/Item_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  List<Item?>? cartItems ;
  double? subTotal,discount,total;


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartItems =[];
    subTotal=discount=total=0.0;
  }

  void milkOffer(){
  if(cartItems!.any((element) => element!.name=="Milk")){
   int index = cartItems!.indexWhere((element) => element!.name=="Milk");
   Item item = cartItems!.elementAt(index)!;
   int? quantity = item.quantity;
   const int buy =3,free=1;
   int pack = buy+free;
   int payingPackNumber= (quantity!~/pack) ;
   int payingIndividual =(quantity%pack);
   int totalBuyNumber = buy*payingPackNumber+payingIndividual;
   double totalPay = totalBuyNumber*item.unitPrice!;
   total = total! +dp(totalPay,2);
   subTotal = subTotal! +dp(quantity*item.unitPrice!,2);
   discount=discount!+dp(subTotal!-totalPay,2);
   update();
  }
  }

  void beardButterOffer(){
    if(cartItems!.any((element) => element!.name=="Bread")){

    }
  }

  addToCart(Item item){
  cartItems!.add(item);
  update();
  }
  removeFromCart(Item item){
  cartItems!.remove(item);
  update();
  }

  double dp(double val, int places){
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }
}