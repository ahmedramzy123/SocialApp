import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/module/edit_screen/edit_model/cover_image.dart';
import 'package:socialapp/module/edit_screen/edit_model/profile_image.dart';

class EditScreen extends StatelessWidget {
TextEditingController name = TextEditingController();
TextEditingController bio = TextEditingController();
TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit,SocialAppStates>(
      listener: (context, state) {},
      builder: (context,state){
        var image =SocialAppCubit.get(context).profileImage;
        var coverImage =SocialAppCubit.get(context).coverImage;
        var user =SocialAppCubit.get(context).user;
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: ()
              {
                Navigator.pop(context);
              },icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.0,
              title: Text("Settings",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
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
                        SocialAppCubit.get(context).updateUserData(bio: bio.text, name: name.text, phone: phone.text);
                      }, child: Text("UPDATE",style: TextStyle(fontSize: 17,color: Colors.white),))),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is UpdateUserDataLoading)
                  LinearProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 190,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                         CoverImage(()
                         {
                           SocialAppCubit.get(context).getCoverImage();

                         },coverImage !=null? FileImage(coverImage):NetworkImage( "${user!.coverimage}") as ImageProvider,
                            ),
                          ProfileImage(()
                          {
                            SocialAppCubit.get(context).getProfileImage();
                          },
                            image !=null? FileImage(image):NetworkImage("${user!.image}") as ImageProvider,
                            )


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(children: [
                      if(SocialAppCubit.get(context).profileImage!=null)
                         Expanded(
                        child: Column(
                          children: [
                            if(state is UploadProfileImageLoading)
                               LinearProgressIndicator(),
                            SizedBox(height: 20,),
                            InkWell(
                              onTap: ()
                              {
                                SocialAppCubit.get(context).uploadProfileImage();
                              },
                              child: Container(
                                width: 110,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: Colors.blueAccent

                                ),
                                child: Center(child: Text("Upload Profile",style: TextStyle(fontSize: 15,color: Colors.white),)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      if(SocialAppCubit.get(context).coverImage!=null)
                         Expanded(
                        child: Column(
                          children: [
                            if (state is UploadCoverImageLoading)
                              LinearProgressIndicator(),
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: ()
                              {
                                SocialAppCubit.get(context).uploadCoverImage();
                              },
                              child: Container(
                                width: 110,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(8),
                                  color: Colors.blueAccent

                                ),
                                child: Center(child: Text("Upload Cover",style: TextStyle(fontSize: 15,color: Colors.white),)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black
                      )
                    ),
                    child: TextFormField(
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text("Name"),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black
                      )
                    ),
                    child: TextFormField(
                      controller: bio,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note),
                        label: Text("Bio"),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black
                      )
                    ),
                    child: TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        label: Text("Phone"),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
