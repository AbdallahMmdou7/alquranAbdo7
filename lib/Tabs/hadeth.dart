import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hadeth extends StatelessWidget {
  const Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/minBack.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
