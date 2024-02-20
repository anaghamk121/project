import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Cartitem {
  final String id;
  final String title;
  final String scientificname;
  final String image;
  final String description;
  final double price;
  final int qty;

  Cartitem({
    required this.id,
    required this.title,
    required this.scientificname,
    required this.image,
    required this.description,
    required this.price,
    required this.qty,
  });
}

class Cart with ChangeNotifier {
  Map<String, Cartitem> _items = {};

  Map<String, Cartitem> get items {
    return {..._items};
  }

  void additem({required String plantid, price, title}) {
    if (_items.containsKey(plantid)) {
      _items.update(
          plantid,
          (value) => Cartitem(
              id: value.id,
              title: value.title,
              scientificname: value.scientificname,
              image: value.image,
              description: value.description,
              price: value.price,
              qty: value.qty + 1));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          plantid,
          () => Cartitem(
                id: DateTime.now().toString(),
                title: title.toString(),
                scientificname: 'scientificname'.toString(),
                image: 'image'.toString(),
                description: 'description'.toString(),
                price: price.toDouble(),
                qty: 1,
              ));
      notifyListeners();
    }
  }

  double get totalToPay {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.qty;
    });
    return total;
  }
  void removeitem(String plantId){
    _items.remove(plantId);
    notifyListeners();
    void clearCart(){
      _items ={};
      notifyListeners();
    }
  }
}
