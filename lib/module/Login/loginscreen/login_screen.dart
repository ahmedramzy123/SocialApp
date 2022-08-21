import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialapp/layout/layout_screen.dart';
import 'package:socialapp/module/Login/cubit/cubit/cubits.dart';
import 'package:socialapp/module/Login/cubit/states/states.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/emailaddress.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/login_button.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/password.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/rigister_button.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/text%20forget.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/textLogin.dart';
import 'package:socialapp/module/Login/loginscreen/loginmodel/topimage.dart';


class LoginScreen extends StatelessWidget {
var keyform =GlobalKey<FormState>();
TextEditingController email =TextEditingController();
TextEditingController password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state)
        {
          if(state is UserLoginSuccess)
            {
              Fluttertoast.showToast(
                     msg: "successful",
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 2,
                     backgroundColor: Colors.green,
                     textColor: Colors.white,
                     fontSize: 16.0
                 );
              LoginCubit.get(context).saveTokenAndNave(context, key: "token", value: state.token);
               }
             else if(state is UserLoginError)
             {
               Fluttertoast.showToast(
                   msg: "${state.error}",
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.BOTTOM,
                   timeInSecForIosWeb: 2,
                   backgroundColor: Colors.red,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
             }

        },
        builder:  (context, state) {
          return  GestureDetector(
            onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: keyform,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25,),
                      topimage(),
                      SizedBox(height: 10,),
                      TextLogin(),
                      SizedBox(height: 10,),
                      EmailAddress(prefixIcon: Icons.email_outlined,text: "Login Email", emailaddress: email,),
                      PasswordLogin(text: "Password", prefixIcon: Icons.lock, sucsesIcon: LoginCubit.get(context).suffix, password: password, method: ()
                      {
                        LoginCubit.get(context).changeObscure();
                      }, secure: LoginCubit.get(context).obscure,),
                      SizedBox(height: 10,),
                      TextForget(),
                      LoginButton(function: ()
                      {
                        LoginCubit.get(context).userLogin(email: email.text, password: password.text);
                      },),
                      SizedBox(height: 10,),
                      RigisterButton()








                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
