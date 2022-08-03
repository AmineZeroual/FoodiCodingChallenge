
import 'package:flutter/cupertino.dart';

class Item{
  String? name,description,type,image;
  double? unitPrice;
  int? quantity;
  ValueNotifier<bool> isInCart = ValueNotifier(false) ;

  Item(this.name, this.description, this.type, this.unitPrice, this.quantity,this.image);
}