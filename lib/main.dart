import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/layout/layout_screen.dart';
import 'package:socialapp/module/Login/cubit/cubit/cubits.dart';
import 'package:socialapp/module/Login/loginscreen/login_screen.dart';
import 'package:socialapp/shared/bloc_observer.dart';
import 'package:socialapp/shared/constant/constant.dart';
import 'package:socialapp/shared/network/sharedpreferences/catchhelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(()=>SocialAppCubit(),blocObserver: MyBlocObserver());
  await CatchHelper.init();
  Widget widget;
   token =CatchHelper.getData(key: "token");
  print(token);
  if(token !=null)
    {
      widget= LayoutScreen();
    }else
      {
        widget = LoginScreen();
      }
  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  MyApp(this.startwidget);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialAppCubit()..getDataUser()..getPostData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startwidget,
      ),
    );
  }
}
