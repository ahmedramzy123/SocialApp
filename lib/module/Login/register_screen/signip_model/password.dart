import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PasswordSignup extends StatelessWidget {
  final String text;
  final TextEditingController password;
  final IconData prefixIcon;
  final IconData sucsesIcon;
  final Function() method;
  final bool obscure;
  PasswordSignup({required this.text,required this.prefixIcon,required this.sucsesIcon,required this.password, required this.method,required this.obscure});
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(
        milliseconds: 2400
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: TextFormField(
          controller: password,
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
          obscureText: obscure,
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
            labelText: text,
            labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),
            prefixIcon: Icon(prefixIcon,color: Colors.grey,),
            suffixIcon: IconButton(color: Colors.grey, onPressed: method, icon: Icon(sucsesIcon),),

          ),
        ),
      ),
    );
  }
}
