import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';

import '2 get started.dart';


class photo extends StatefulWidget {
  @override
  State<photo> createState() => _photoState();
}

class _photoState extends State<photo> {
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          //nav-one state to another ,
          context,
          MaterialPageRoute(builder: (context) => start()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage("images/greenega logo.png"),
        ),
      ),
    );
  }
}
