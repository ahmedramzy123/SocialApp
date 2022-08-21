import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TextForget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 2600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: (){}, child: Text("Forget Password ?")),
        ],
      ),
    );
  }
}
