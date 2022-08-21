import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class topimage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  FadeInDown(
      delay: Duration(milliseconds: 1800),
      child: Center(
        child: Container(
          height: 200,
          width: 340,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15.0),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/social1.webp")
              )
          ),
        ),
      ),
    );
  }
}
