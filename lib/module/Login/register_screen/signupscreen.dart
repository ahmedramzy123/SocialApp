import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/module/Login/cubit/cubit/cubits.dart';
import 'package:socialapp/module/Login/cubit/states/states.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/emailaddress.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/name.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/numberuser.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/password.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/signup_button.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/textsignup.dart';
import 'package:socialapp/module/Login/register_screen/signip_model/topimage.dart';

class SignUpScreen extends StatelessWidget {
  var keyform = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: keyform,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      topimage(),
                      SizedBox(height: 10,),
                      TextSignUp(),
                      SizedBox(height: 10,),
                      EmailAddress(prefixIcon: Icons.email_outlined,
                        text: "Email ID",
                        emailaddress: email,),
                      NameUser(text: "Full Name",
                          prefixIcon: Icons.person,
                          name: name),
                      PhoneNumber(num: 'Phone',
                        prefixIcon: Icons.phone_android,
                        number: phone,),
                      PasswordSignup(text: "Password",
                        prefixIcon: Icons.lock,
                        sucsesIcon: LoginCubit.get(context).suffix,
                        password: password, method: () {
                        LoginCubit.get(context).changeObscure();
                        }, obscure: LoginCubit.get(context).obscure,),
                      SizedBox(height: 20,),
                      SignupButton(function: ()
                      {
                        LoginCubit.get(context).userRigister(
                            email: email.text,
                            password: password.text,
                            name: name.text,
                            phone: phone.text);
                      },)
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
