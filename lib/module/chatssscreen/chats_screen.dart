import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/module/chatssscreen/buildchatitem.dart';

class ChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit,SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            title: Text("Chats",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
          ),
          body: ConditionalBuilder(
            condition: SocialAppCubit.get(context).users.length > 0,
            builder: (context)=>ListView.separated(
                itemBuilder: (context,index)=>buildChatItem(SocialAppCubit.get(context).users[index]),
                separatorBuilder: (context,index)=>Container (
                  height: 1,
                  color: Colors.grey[400],
                ),
                itemCount: SocialAppCubit.get(context).users.length),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },

    );
  }
}
