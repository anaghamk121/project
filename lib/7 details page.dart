import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';

class detailspage extends StatelessWidget {
  static const id = '/detailspage';
//final String id ;
  const detailspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),body: Center(child: Text("ID: $id"),),
    );
  }
}
