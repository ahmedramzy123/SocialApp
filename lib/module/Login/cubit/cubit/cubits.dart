import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layout/layout_screen.dart';
import 'package:socialapp/model/model_user/model_user.dart';
import 'package:socialapp/module/Login/cubit/states/states.dart';
import 'package:socialapp/module/Login/loginscreen/login_screen.dart';
import 'package:socialapp/shared/constant/constant.dart';
import 'package:socialapp/shared/network/sharedpreferences/catchhelper.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(InitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);
  bool obscure = true;
  IconData suffix = Icons.visibility;
  void changeObscure()
  {
    obscure = !obscure;
    suffix =obscure?Icons.visibility: Icons.visibility_off;
    emit(ChangeObscureSuccessState());
  }
  void userRigister({
  required String email,
  required String password,
  required String name,
  required String phone,
})
  {
    emit(UserRigisterLoading());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)
   {
     createUserData(phone: phone, name: name, password: password, email: email, uid: value.user!.uid);
     emit(UserRigisterSuccess());
   }).catchError((error)
    {
      emit(UserRigisterError());
    });
  }
  void userLogin({
    required String email,
    required String password,
})
  {
    emit(UserLoginLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value)
    {
      emit(UserLoginSuccess(value.user!.uid));
    }).catchError((error)
    {
      emit(UserLoginError(error.toString()));
    });
  }
  void saveTokenAndNave(context,{
  required String key,
  required String value,
})
  {
    CatchHelper.saveData(key: key, value: value).then((value)
    {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LayoutScreen()), (route) => false);
    });
  }
  void createUserData({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String uid,
    String bio ="",
    String image = "https://as2.ftcdn.net/v2/jpg/00/64/67/27/1000_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg",
    String coverImage="https://as2.ftcdn.net/v2/jpg/00/64/67/27/1000_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg"
  })
  {
    ModelUser model = ModelUser(uid, image, phone, email, name,coverImage,bio);
    FirebaseFirestore.instance
    .collection("users")
    .doc(uid)
    .set(model.toMap())
    .then((value)
    {print("successful");
    emit(UserCreateSuccess());
    })
    .catchError((error)
  {
  emit(UserCreateError(error.toString()));

  });
  }

}