import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/module/homescreen/home_screentools/post_model/bottomsceen.dart';

class PostScreen extends StatelessWidget {
TextEditingController text =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit,SocialAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var model = SocialAppCubit.get(context).user;
        var postImage =SocialAppCubit.get(context).postImage;
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(icon: Icon(Icons.close,color: Colors.black,),onPressed: ()
            {
              Navigator.pop(context);
            }),
            title: Text("Create Post",style: TextStyle(color: Colors.black),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 80,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.blue,
                    ),
                    child: TextButton(onPressed: ()
                    {
                      SocialAppCubit.get(context).sentPostData(date: DateTime.now().toString(), text: text.text);
                    }, child: Text("Post",style: TextStyle(fontSize: 17,color: Colors.white),))),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("${model!.image}"),
                    ),
                    SizedBox(width: 10,),
                    Text("${model.name}")
                  ],
                ),
                TextField(
                  controller: text,
                  decoration: InputDecoration(
                      hintText: "What is on your mind ...",
                      border: InputBorder.none
                  ),
                ),
                if(postImage!=null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Stack(
                        children: [
                          Image(
                            image: FileImage(SocialAppCubit.get(context).postImage!),
                            width: double.infinity,
                            height: 250,

                          ),
                          IconButton(onPressed: ()
                          {
                            // SocialAppCubit.get(context).closePostImage();
                          }, icon: Icon(Icons.close)),
                        ],
                      ),
                      IconButton(onPressed: ()
                      {
                        SocialAppCubit.get(context).uploadPostImage();
                      }, icon: Icon(Icons.done_outline,color: Colors.blueAccent,)),

                    ],
                  ),
                Spacer(),
                Row(children: [
                  bottomPostScreen(()
                  {
                    SocialAppCubit.get(context).getPostImage();
                  }
                      ,Icons.image,"Add Photos"),
                  SizedBox(width: 20,),
                  bottomPostScreen((){},Icons.camera,"Camera"),
                  SizedBox(width: 20,),
                  bottomPostScreen((){},Icons.tag,"Tag People"),

                ],)

              ],
            ),
          ),
        );
      },
    );
  }
}
