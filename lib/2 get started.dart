import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';

import '2 getstart button.dart';


class start extends StatelessWidget {
  start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "In Love with Plants",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 16,
            child: Text(
              "beauty blooms in the heart as well as garden",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: GetStartedButton(),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/img.png"),
        )),
      ),
    );
  }
}
