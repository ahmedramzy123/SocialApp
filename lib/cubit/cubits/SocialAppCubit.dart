import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/model/model_user/model_chat.dart';
import 'package:socialapp/model/model_user/model_post.dart';
import 'package:socialapp/model/model_user/model_user.dart';
import 'package:socialapp/module/Login/loginscreen/login_screen.dart';
import 'package:socialapp/module/chatssscreen/chats_screen.dart';
import 'package:socialapp/module/homescreen/home_screen.dart';
import 'package:socialapp/module/settingscreen/setting_screen.dart';
import 'package:socialapp/module/user_screen/userscreen.dart';
import 'package:socialapp/shared/constant/constant.dart';
import 'package:socialapp/shared/network/sharedpreferences/catchhelper.dart';


class SocialAppCubit extends Cubit<SocialAppStates> {
  SocialAppCubit() :super(InitialShopAppState());

  static SocialAppCubit get(context) => BlocProvider.of(context);
  int Currentindex = 0;

  void Changeindex(index) {
    if(index==1)
      getAllUsers();
    if(index==0)
      getPostData();
    Currentindex = index;
    emit(ChangeIndexSuccess());
  }

  List<Widget> bodyScreen =
  [
    HomeScreen(),
    ChatsScreen(),
    StatusScreen(),
    SettingScreen()
  ];

  void deleteUser(context, {
    required String key
  }) {
    CatchHelper.deleteToken(key: key).then((value) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => LoginScreen()), (
          route) => false);
    });
  }

  File? profileImage;

  Future getProfileImage() async
  {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      profileImage = File(PickedFile.path);
      print(PickedFile.path);
      emit(GetProfileImageSuccess());
    }
    else {
      print("NO image selected ");
    }
  }
  // /data/user/0/com.example.socialapp/cache/image_picker1731452439.jpg
  String? profileImageUrl ;
  void uploadProfileImage()
  {
    emit(UploadProfileImageLoading());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((p0)
    {
      p0.ref.getDownloadURL().then((value)
      {
        print("UploadProfileImageSuccess");
        profileImageUrl = value;
        print(profileImageUrl);

        emit(UploadProfileImageSuccess());
      }).catchError((error)
      {
        emit(GetDownloadURLProfileError(error.toString()));
      });
    })
        .catchError((error)
    {
      emit(UploadProfileImageError(error.toString()));
    });
  }
  File? coverImage;
  String? coverImageUrl ;
  Future getCoverImage() async
  {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      coverImage = File(PickedFile.path);
      emit(GetProfileImageSuccess());
    }
    else {
      print("NO image selected ");
    }
  }
  void uploadCoverImage()
  {
    emit(UploadCoverImageLoading());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((p0)
    {
      p0.ref.getDownloadURL().then((value)
      {
        print("UploadCoverImageSuccess");
        coverImageUrl = value;
        print(coverImageUrl);

        emit(UploadCoverImageSuccess());
      }).catchError((error)
      {
        emit(GetDownloadURLCoverError(error.toString()));
      });
    })
        .catchError((error)
    {
      emit(UploadCoverImageError(error.toString()));
    });
  }

  ModelUser? user;
  void getDataUser() {
    emit(GetDataUserLoading());

    FirebaseFirestore.instance
    .collection("users")
    .doc(token)
    .get()
    .then((value)
    {
      print(value.data());
      user = ModelUser.fromJson(value.data() as Map<String,dynamic>);
      emit(GetDataUserSuccess());
    }).catchError((error)
    {
      emit(GetDataUserError(error.toString()));
    });
  }
  void updateUserData(
  {
  required String name,
  required String bio,
  required String phone,
})
  {
    emit(UpdateUserDataLoading());
   if (profileImageUrl!="" && coverImageUrl !="")
     {
       sentUpdateData(name: name, bio: bio, phone: phone, image: profileImageUrl!, coverImage: coverImageUrl!);
     }else
       {
         sentUpdateData(name: name, bio: bio, phone: phone, image: user!.image!, coverImage: user!.coverimage!);
       }

}
void sentUpdateData(
  {
    required String name,
    required String bio,
    required String phone,
    required String image,
    required String coverImage,
})
{
  ModelUser model =ModelUser(user!.uid,image, phone, user!.email, name, bio, coverImage);
  FirebaseFirestore.instance
      .collection("users")
      .doc(token)
      .update(model.toMap())
      .then((value)
  {
    print("succsessful");
    emit(UpdateUserDataSuccess());
  }).catchError((error)
  {
    emit(UpdateUserDataError(error.toString()));
  });
}
File? postImage;
  String postImageUrl ="";
  Future getPostImage()async
  {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      postImage = File(PickedFile.path);
      emit(GetPostImageSuccess());
    }
    else {
      print("NO image selected ");
    }
  }
  void uploadPostImage()
  {
    emit(UploadPostImageLoading());
    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((p0)
    {
      p0.ref.getDownloadURL().then((value)
      {
        print("UploadPostImageSuccess");
        postImageUrl = value;
        print(postImageUrl);

        emit(UploadPostImageSuccess());
      }).catchError((error)
      {
        emit(GetDownloadURLCoverError(error.toString()));
      });
    })
        .catchError((error)
    {
      emit(UploadPostImageError(error.toString()));
    });
  }
 void sentPostData ({
required  String  text,
required  String  date,
}) {
   emit(SetPostLoading());
   ModelPost post = ModelPost(
       token, user!.image, text, user!.name, date, postImageUrl);
   FirebaseFirestore.instance
       .collection("posts")
       .add(post.toMap() )
       .then((value) {
         print("Done");
     emit(SetPostSuccess());
   })
       .catchError((error) {
     emit(SetPostError(error.toString()));
   }
   );
 }

 List<ModelPost> postData = [];
 List<String> postId = [];
 List<int> likes = [];
 void getPostData()
 {
   emit(GetPostDataLoading());
   FirebaseFirestore.instance
       .collection("posts")
       .get()
       .then((value)
   {
     postData=[];
     value.docs.forEach((element)
     {
       element.reference
       .collection("likes")
       .get()
       .then((value)
       {
         likes.add(value.docs.length);
         postId.add(element.id);
         postData.add(ModelPost.fromJson(element.data()));
         print(element.data());
         emit(GetLikesSuccess());
       })
       .catchError((error){});

     });
     print("Done Get Data");
     emit(GetPostDataSuccess());
   })
       .catchError((error)
   {
     emit(GetPostDataError(error.toString()));
   });
 }
List <ModelUser> users = [];
 void getAllUsers()
 {
   emit(GetAllUsersLoading());
   users =[];
   FirebaseFirestore.instance
   .collection("users")
   .get()
   .then((value) 
   {
     value.docs.forEach((element) 
     {
       if(element.data()["uid"]!=user!.uid)
          users.add(ModelUser.fromJson(element.data()));
     });
     print("Successfull Get All Users ");
     emit(GetAllUsersSuccess());
   })
   .catchError((error)
   {
     emit(GetAllUsersError(error.toString()));
   });
 }
void sentChat({
  required String receiverId,
  required String dateTime,
  required String text,
})
{
  ModelChat chat =ModelChat(user!.uid, receiverId, dateTime, text);
  FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .collection("chat")
      .doc(receiverId)
      .collection("message")
      .add(chat.toMap())
  .then((value)
  {
    print("successfully sent chat");
    emit(SentChatSuccess());
  })
  .catchError((error)
  {
    emit(SentChatError(error.toString()));
  });
  FirebaseFirestore.instance
      .collection("users")
      .doc(receiverId)
      .collection("chat")
      .doc(user!.uid)
      .collection("message")
      .add(chat.toMap())
      .then((value)
  {
    print("successfully sent chat");
    emit(SentChatSuccess());
  })
      .catchError((error)
  {
    emit(SentChatError(error.toString()));
  });

 }
 List<ModelChat> messages = [];
 void getChat({
   required String receiverId,
 })
 {
   FirebaseFirestore.instance
       .collection("users")
       .doc(user!.uid)
       .collection("chat")
       .doc(receiverId)
       .collection("message")
       .snapshots()
       .listen((event)
   {
     messages=[];
     event.docs.forEach((element)
     {
       messages.add(ModelChat.fromJson(element.data()));
       emit(GetChatSuccess());
     });
   });
 }
 void likePost(
  {
  required String uidPost
}
     )
 {
   FirebaseFirestore.instance
       .collection("posts")
       .doc(uidPost)
       .collection("likes")
       .doc(user!.uid)
       .set({
     "like":true,
   })
       .then((value)
   {
     print("successfuly like post");
     emit(SentLikePostSuccess());
   })
       .catchError((error)
   {
     emit(SentLikePostError(error.toString()));
   });
 }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  void moreShow()
 {
   scaffoldKey.currentState!.showBottomSheet((context) => Container(
     width: double.infinity,
     height: 150,
     color: Colors.white38,
     child: Column(
       children: [
         SizedBox(height: 20,),
         Container(
           width: 30,
           height: 2,
           color: Colors.grey[600],
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             width: double.infinity,
             height: 100,
             decoration: BoxDecoration(
               color: Colors.white
             ),
             child: Column(
               children: [
                 SizedBox(height: 15,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Icon(Icons.push_pin_rounded),
                         Text("Pin Post",style: TextStyle(fontSize: 20),),
                       ],
                     ),
                     SizedBox(height: 15,),
                     Container(
                       width: double.infinity,
                       height: 1,
                       color: Colors.grey,
                     ),
                     SizedBox(height: 15,),
                     Row (
                       children: [
                         Icon(Icons.save),
                         Text("Save Post",style: TextStyle(fontSize: 20)),
                       ],
                     ),
                   ]
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
   )
   );
   emit(ShowMoreState());
 }
}