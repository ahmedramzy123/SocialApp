import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TextSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 2000),
      child: Container(
          width:120,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Center(child: Text("Sign Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),))),
    );
  }
}
