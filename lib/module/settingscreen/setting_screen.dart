import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/module/edit_screen/edit_model/profile_image.dart';
import 'package:socialapp/module/edit_screen/edit_screen.dart';
import 'package:socialapp/module/settingscreen/setting_model/cover_image.dart';
import 'package:socialapp/module/settingscreen/setting_model/profile_image.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit,SocialAppStates>(
      listener: (context, state) {},
      builder: (context,state){
        var user = SocialAppCubit.get(context).user;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.0,
              title: Text("Settings",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CoverImageSetting("${user!.coverimage}"),
                        ProfileImageSetting(
                            "${user.image}")
                      ],
                    ),
                  ),
                ),
                Text("${user.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("${user.bio}",style: Theme.of(context).textTheme.caption,),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 35,),
                    Column(
                      children: [
                        Text("100"),
                        Text("post"),
                      ],
                    ),
                    SizedBox(width: 35,),
                    Column(
                      children: [
                        Text("100"),
                        Text("Photos"),
                      ],
                    ),
                    SizedBox(width: 35,),
                    Column(
                      children: [
                        Text("100"),
                        Text("Followers"),
                      ],
                    ),
                    SizedBox(width: 35,),
                    Column(
                      children: [
                        Text("100"),
                        Text("Following"),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(5.0),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey
                          )
                        ),
                        child: TextButton(onPressed: (){},child: Text("ADD Photos")),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditScreen()));
                        },
                        child: Container(
                          width: 50,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(5.0),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey
                            )
                          ),
                          child: Icon(Icons.edit,color: Colors.blueAccent,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        );
      },
    );
  }
}
