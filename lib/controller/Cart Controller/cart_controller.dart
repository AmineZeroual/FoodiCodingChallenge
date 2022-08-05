
import 'package:foodi_coding_challenge/model/Item_model.dart';
import 'package:get/get.dart';

import '../../model/constant.dart';

class CartController extends GetxController {
  List<Item?>? cartItems;

  double? subTotal, discount, total;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartItems = [];
    subTotal = discount = total = 0.0;
  }

  void milkOffer() {
    //condition to assure existing of milk in the cart
    if (cartItems!.any((element) => element!.name == "Milk")) {
      //find the index of the milk item
      int index = cartItems!.indexWhere((element) => element!.name == "Milk");
      //store the item
      Item item = cartItems!.elementAt(index)!;
      int? quantity = item.quantity;
      //init the buy and free value for the offer
      const int buy = 3, free = 1;
      //the full pack is what you buy + the free one
      int pack = buy + free;
      //calculating what is the quantity that we should pay for
      //we need to find the number of packs & and the rest
      //calculating the number of packs (~/ : Quotient  )
      int payingPackNumber = (quantity! ~/ pack);
      //calculating the number of individual item that we should pay out of the offer(% : rest of division)
      int payingIndividual = (quantity % pack);
      //Calculating the total quantity
      int totalBuyNumber = buy * payingPackNumber + payingIndividual;
      cartItems!.elementAt(index)!.totalPrice =
          dp(totalBuyNumber * item.unitPrice, 2);
      //condition to display offer and discount value
      if (quantity > buy) {
        cartItems!.elementAt(index)!.discount =
            dp(quantity * item.unitPrice, 2);
        cartItems!.elementAt(index)!.isDiscounted = true;
      } else {
        cartItems!.elementAt(index)!.isDiscounted = false;
      }
      update();
    }
  }

  void beardButterOffer() {
    //offer pack quantity number
    int pack = 2;
    //condition to assure existing of Bread & Butter in the cart
    if (cartItems!.any((element) => element!.name == "Bread") &&
        cartItems!.any((element) => element!.name == "Butter")) {
      //find the index of the Bread & Butter items
      int indexBread =
          cartItems!.indexWhere((element) => element!.name == "Bread");
      int indexButter =
          cartItems!.indexWhere((element) => element!.name == "Butter");
      //store the items
      Item butter = cartItems!.elementAt(indexButter)!;
      Item bread = cartItems!.elementAt(indexBread)!;
      //Calculating the number of butter packs
      int butterPack = butter.quantity! ~/ pack;
      //Bread price depend on the butter quantity
      //so for each 2 butter there is 50% discount on 1 bread
      //so for every butter packs we take from the bread quantity the packs number and multiply it with 0.5
      //and last thing is multiply the number of bread with it cost
      double breadPrice = bread.unitPrice *
          ((bread.quantity! - butterPack) + (0.5 * butterPack));
      //update total price in the cart
      cartItems!.elementAt(indexBread)!.totalPrice = dp(breadPrice, 2);
      cartItems!.elementAt(indexButter)!.calculateTotalItemPrice();
      //condition to display offer and discount
      if (butter.quantity! > 1) {
        cartItems!.elementAt(indexBread)!.isDiscounted = true;
        cartItems!.elementAt(indexBread)!.discount =
            dp(bread.unitPrice * bread.quantity!, 2);
      } else {
        cartItems!.elementAt(indexBread)!.isDiscounted = false;
      }
    } else {
      //condition in case there is only Bread in cart
      if (cartItems!.any((element) => element!.name == "Bread")) {
        int indexBread =
            cartItems!.indexWhere((element) => element!.name == "Bread");
        cartItems!.elementAt(indexBread)!.calculateTotalItemPrice();
      }
      //condition in case there is only butter in cart
      if (cartItems!.any((element) => element!.name == "Butter")) {
        int indexButter =
            cartItems!.indexWhere((element) => element!.name == "Butter");
        cartItems!.elementAt(indexButter)!.calculateTotalItemPrice();
      }
    }
    update();
  }

  calculateTotalCartPrices() {
    //clear total prices
    clearData();
    //calculate milk items prices
    milkOffer();
    //calculate Butter & Bread items prices
    beardButterOffer();
    //calculate all items Cart Cost
    for (var element in cartItems!) {
      total = dp(total! + element!.totalPrice!, 2);
      subTotal = dp(subTotal! + (element.unitPrice * element.quantity!), 2);
      discount = dp(subTotal! - total!, 2);
    }
    update();
  }

  clearData() {
    subTotal = total = discount = 0;
  }

  addToCart(Item item) {
    //condition to avoid duplicated items
    if (!cartItems!.contains(item)) {
      //add selected item to the cart
      item.totalPrice = item.unitPrice;
      cartItems!.add(item);
    } else {
      snackBar(title: "Item Exist", message: "You already added this item");
    }
    update();
  }

  removeFromCart(Item item) {
    cartItems!.remove(item);
    update();
  }
}
