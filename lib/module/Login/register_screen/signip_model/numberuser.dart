import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatelessWidget {
  final String num;
  final TextEditingController number;
  final IconData prefixIcon;
  PhoneNumber({required this.num,required this.prefixIcon,required this.number});
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 2200),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: number,
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return "email Address must not be empty ";
            }
          },
          keyboardType: TextInputType.emailAddress,
          showCursor: true,
          readOnly: false,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent
              )
            ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,width: 2
                )
              ),
              labelText: num,
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              prefixIcon: Icon(prefixIcon,color: Colors.grey,),

          ),
        ),
      ),
    );
  }
}
