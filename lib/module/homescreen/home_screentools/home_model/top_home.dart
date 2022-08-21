import 'package:flutter/material.dart';
import 'package:socialapp/module/homescreen/home_screentools/post_screen.dart';
import 'package:socialapp/module/homescreen/home_screentools/home_model/send_post.dart';

class TopHome extends StatelessWidget {
final String image;
final Function() method;
TopHome(this.method,this.image);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(children: [
          Text("SocialApp",style: TextStyle(fontSize: 25),),
          Spacer(),
          TextButton(onPressed: method, child: Text("Logout",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),))
        ],),
        SizedBox(height: 5,),
        SendPost(image,
                ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
            }),
        SizedBox(height: 5,),
        Container(
          width: double.infinity,
          height: 8,
          color: Colors.grey[400],
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
