import 'package:flutter/material.dart';
import 'package:socialapp/model/model_user/model_user.dart';
import 'package:socialapp/module/chatssscreen/chatdetailsscreen.dart';

class buildChatItem extends StatelessWidget {
ModelUser model;
buildChatItem(this.model);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child:   InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatDetailsScreen(model)));
        },
        child: Row(

          children: [

            CircleAvatar(

              radius: 20,

              backgroundImage: NetworkImage("${model.image}"),



            ),

            SizedBox(width: 5,),

            Text("${model.name}",style: TextStyle(fontSize: 20),)

          ],

        ),
      ),
    );
  }
}
