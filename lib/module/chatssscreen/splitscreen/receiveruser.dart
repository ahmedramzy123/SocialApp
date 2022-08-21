import 'package:flutter/material.dart';
import 'package:socialapp/model/model_user/model_chat.dart';

class RecevierUser extends StatelessWidget {
  ModelChat model ;
  RecevierUser(this.model);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10
        ),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              bottomEnd: Radius.circular(10.0),
            )
        ),
        child: Text("${model.text}"),
      ),
    );
  }
}
