import 'package:flutter/material.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/model/model_user/model_post.dart';

class ViewPost extends StatelessWidget {
 int index;
ModelPost model;
ViewPost(this.model,this.index);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage("${model.profileimage}")
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("${model.name}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      Icon(Icons.check_circle,
                        color: Colors.blueAccent,
                        size: 18,
                      ),
                    ],
                  ),
                  Text("${model.date}",style: Theme.of(context).textTheme.caption ,),
                ],
              ),
              Spacer(),
              IconButton(onPressed: ()
              {
                SocialAppCubit.get(context).moreShow();
              }, icon: Icon(Icons.more_horiz))


            ],
          ),
          SizedBox(height: 10,),
          Container(
              child: Text("${model.text}")),
          SizedBox(height: 10,),
          if(model.postimage != "")
            Container (
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                image: DecorationImage(
                    image: NetworkImage("${model.postimage}"),
                    fit: BoxFit.contain
                )
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 2,
            color: Colors.grey[400],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              InkWell(
                onTap: ()
                {
                  SocialAppCubit.get(context).likePost(uidPost: SocialAppCubit.get(context).postId[index]);
                },
                child: Row(
                  children: [
                    Icon(Icons.favorite_border,size: 20,color: Colors.redAccent,),
                    SizedBox(width: 5,),
                    Text("${SocialAppCubit.get(context).likes[index]}",style: TextStyle(fontSize: 15,color: Colors.redAccent),),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Icon(Icons.comment,size: 25,),
                    Text("120",style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Container(
            color: Colors.grey[500],
            height: 5,
          ),
          SizedBox(height: 8,),

        ],
      ),
    );
  }
}
