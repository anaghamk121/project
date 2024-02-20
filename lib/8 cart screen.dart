import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';
import 'package:provider/provider.dart';
import '8 cart page.dart';
import '8 cart provider.dart';

class CartScreen extends StatelessWidget{
  static const id = '/Cart';
  const CartScreen ({Key ?key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart"),),
      body: Column(children: [Card(
        margin: const EdgeInsets.all(20),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text('Total'),

                Spacer(),
                Chip(label: Text("${cart.totalToPay.toString()} \$")),
                TextButton(onPressed: (){}, child: Text("Order Now"))
              ],
      ),),

    ),
      const SizedBox(height: 20,),
      Expanded(child: ListView.builder(
    itemCount: cart.items.length,
    itemBuilder:(context, index) =>CartItemTile(
    id: cart.items.values.toList()[index].id,
    title: cart.items.values.toList()[index].title,
    scientificname:cart.items.values.toList()[index].scientificname,
    image:cart.items.values.toList()[index].image,
    price: cart.items.values.toList()[index].price,
    description:cart.items.values.toList()[index].description,
    qty: cart.items.values.toList()[index].qty,
    productId: cart.items.keys.toList()[index], scientificName: '',
    )))]));
}}