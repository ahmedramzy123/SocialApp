import 'package:flutter/material.dart';

class SendPost extends StatelessWidget {
final String image;
final Function() func;
SendPost(this.image, this.func);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("${image}"),
          ),
          SizedBox(width: 10,),
          InkWell(
              onTap: func,
              child: Container(
                  width: 250,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15),
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("What's on your mind?"),
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }
}
