import 'package:flutter/material.dart';

import '8 cart provider.dart';

class Orderitem{
  Orderitem({
    required this.id,
    required this.totalPrice,
    required this.orderTime,
    required this.cartitems,
});
  final String id;
  final double totalPrice;
  final DateTime orderTime;
  final List<Cartitem> cartitems;

}
class Oders with ChangeNotifier{
  List<Orderitem> _myOrders =[];
  List<Orderitem> get myOrders{
    return [ ..._myOrders];
  }
  void addOrder({
    required List<Cartitem> cartitems,
    required double totalPrice,
})
  {
    _myOrders.add(Orderitem(id: DateTime.now().toString(),
        totalPrice: totalPrice, orderTime: DateTime.now(), cartitems: cartitems));
    notifyListeners();
  }
}