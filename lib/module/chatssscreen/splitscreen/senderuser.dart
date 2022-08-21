import 'package:flutter/material.dart';
import 'package:socialapp/model/model_user/model_chat.dart';

class SenderUser extends StatelessWidget {
ModelChat model ;
SenderUser(this.model);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10
        ),
        decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              bottomStart: Radius.circular(10.0),
            )
        ),
        child: Text("${model.text}"),
      ),
    );
  }
}
