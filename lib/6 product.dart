

import 'package:flutter/material.dart';

class Plant with ChangeNotifier  {
  final String id;
  final String title;
  final String scientificname;
  final String image;
  final String description;
  final double price;
  bool isfavorite;

  Plant({
    required this.id,
    required this.title,
    required this.scientificname,
    required this.image,
    required this.description,
    required this.price,
     this.isfavorite = false,
}
      );
  void toggleIsFav(){
    isfavorite = !isfavorite;
    notifyListeners();
  }

}