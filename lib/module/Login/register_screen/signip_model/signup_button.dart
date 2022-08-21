import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
final Function() function;
SignupButton({required this.function});
  @override
  Widget build(BuildContext context) {
    return  FadeInDown(
      delay: Duration(milliseconds: 2800),
      child: Container(child: MaterialButton(onPressed:function,child: Text("Continue",style: TextStyle(fontSize: 20,color: Colors.white ),),),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadiusDirectional.circular(15.0),

        ),
      ),
    );
  }
}
