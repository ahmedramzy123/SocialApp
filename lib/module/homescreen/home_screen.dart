import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/module/Login/cubit/cubit/cubits.dart';
import 'package:socialapp/module/homescreen/home_screentools/home_model/send_post.dart';
import 'package:socialapp/module/homescreen/home_screentools/home_model/top_home.dart';
import 'package:socialapp/module/homescreen/home_screentools/home_model/viewpost.dart';

import 'home_screentools/home_model/startviewpost.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit,SocialAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return  Scaffold(
          key: SocialAppCubit.get(context).scaffoldKey,
          body:ConditionalBuilder(
            condition:SocialAppCubit.get(context).postData.length>0,
            builder: (context)=>Column(
              children: [

                TopHome(()
                {
                  SocialAppCubit.get(context).deleteUser(context, key: "token");
                },
                    "${SocialAppCubit.get(context).user!.image}"

                ),
                // if(SocialAppCubit.get(context).postData.isEmpty)
                Expanded(
                  child: ListView.builder(itemBuilder: (context,index)=>ViewPost(
                      SocialAppCubit.get(context).postData[index],index),
                    itemCount: SocialAppCubit.get(context).postData.length,

                  ),
                ),
                // StartViewPost()
              ],
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator())
          )
        );
      },

    );
  }
}

