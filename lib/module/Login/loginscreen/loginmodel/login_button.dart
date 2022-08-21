import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
final Function() function;
LoginButton({required this.function});
  @override
  Widget build(BuildContext context) {
    return  FadeInDown(
      delay: Duration(milliseconds: 2800),
      child: Container(child: MaterialButton(onPressed:function,child: Text("Login",style: TextStyle(fontSize: 20 ,color: Colors.white),),),
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
