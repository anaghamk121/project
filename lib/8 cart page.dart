import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final String id;
  final String title;
  final String scientificName;
  final String image;
  final String description;
  final double price;
  final int qty;

  CartItemTile({
    required this.id,
    required this.title,
    required this.scientificName,
    required this.image,
    required this.description,
    required this.price,
    required this.qty,
    required String scientificname,
    required String productId,
  });

  @override
  Widget build(BuildContext context) {
    // Implement your UI for displaying a single item in the cart here
    return ListTile(
      leading: Image.network(image),
      title: Text(title),
      subtitle: Text('Price: \$${price.toString()}'),
      trailing: Text('Qty: $qty'),
    );
  }
}
