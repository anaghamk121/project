import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';

import '3 Login page.dart';


class GetStartedButton extends StatelessWidget {
  GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => projlogin()));
        },
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 100 * 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0)),
          child: Text(
            "Get Started",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
