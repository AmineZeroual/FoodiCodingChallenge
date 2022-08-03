import 'dart:math';

import 'package:foodi_coding_challenge/model/Item_model.dart';
import 'package:foodi_coding_challenge/model/home_page_constant.dart';
import 'package:get/get.dart';

import '../../model/constant.dart';

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
   cartItems!.elementAt(index)!.totalPrice= dp(totalBuyNumber*item.unitPrice,2);
   if(quantity>buy){
     cartItems!.elementAt(index)!.discount=dp(quantity*item.unitPrice,2);
     cartItems!.elementAt(index)!.isDiscounted=true;
   }else{
     cartItems!.elementAt(index)!.isDiscounted=false;
   }
   update();
  }
  }

  void beardButterOffer(){
    int pack =2;
    if(cartItems!.any((element) => element!.name=="Bread")&&cartItems!.any((element) => element!.name=="Butter")){
      int indexBread = cartItems!.indexWhere((element) => element!.name=="Bread");
      int indexButter = cartItems!.indexWhere((element) => element!.name=="Butter");
      Item butter =cartItems!.elementAt(indexButter)!;
      Item bread = cartItems!.elementAt(indexBread)!;
      int butterPack = butter.quantity!~/pack;
      double breadPrice = bread.unitPrice*((bread.quantity!-butterPack)+(0.5*butterPack));
      cartItems!.elementAt(indexBread)!.totalPrice=dp(breadPrice,2);
      cartItems!.elementAt(indexButter)!.calculateTotalItemPrice();
      if(butter.quantity!>1){
        cartItems!.elementAt(indexBread)!.isDiscounted = true;
        cartItems!.elementAt(indexBread)!.discount=dp(bread.unitPrice*bread.quantity!,2);
      }else{
        cartItems!.elementAt(indexBread)!.isDiscounted = false;
      }


    }else{
      if(cartItems!.any((element) => element!.name=="Bread")){
        int indexBread = cartItems!.indexWhere((element) => element!.name=="Bread");
        cartItems!.elementAt(indexBread)!.calculateTotalItemPrice();

      }
      if(cartItems!.any((element) => element!.name=="Butter")){

        int indexButter = cartItems!.indexWhere((element) => element!.name=="Butter");
        cartItems!.elementAt(indexButter)!.calculateTotalItemPrice();
      }
    }
    update();
}

  calculateTotalCartPrices(){
  clearData();
  milkOffer();
  beardButterOffer();
    for (var element in cartItems!) {
      total = dp(total! + element!.totalPrice!,2);
      subTotal = dp(subTotal! + (element.unitPrice*element.quantity!),2);
      discount = dp(subTotal!-total!,2);
    }
  update();
}
  clearData(){
    subTotal=total=discount=0;
  }

  addToCart(Item item){
  if(!cartItems!.contains(item)){
    item.totalPrice=item.unitPrice;
    cartItems!.add(item);
  }else{
    snackBar(title: "Item Exist",message:"You already added this item" );
  }
  update();
  }

  removeFromCart(Item item){
  cartItems!.remove(item);
  update();
  }


}