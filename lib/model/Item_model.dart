
import 'package:flutter/cupertino.dart';

import 'constant.dart';

class Item{
  String? name,description,type,image;
  double? _unitPrice,totalPrice=0,discount=0;
  int? quantity;
  bool isDiscounted =false;
  ValueNotifier<bool> isInCart = ValueNotifier(false);


  double get unitPrice => _unitPrice!;

  set unitPrice(double value) {
    _unitPrice = value;
  }

  calculateTotalItemPrice(){
    totalPrice = dp(_unitPrice!*quantity!,2);
  }

  @override
  String toString() {
    return 'Item{name: $name, _unitPrice: $_unitPrice, totalPrice: $totalPrice}';
  }

  Item(this.name, this.description, this.type, this._unitPrice, this.quantity,this.image);
}