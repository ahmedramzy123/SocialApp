import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit,SocialAppStates>(
      listener:(context,state){},
      builder:(context,state){
        return   Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            index: SocialAppCubit.get(context).Currentindex,
            onTap: (index)
            {
              SocialAppCubit.get(context).Changeindex(index);
            },
            items:
            [
              Icon(Icons.home),
              Icon(Icons.chat),
              Icon(Icons.circle_outlined),
              Icon(Icons.settings),
            ],
          ),
        body:  SocialAppCubit.get(context).bodyScreen[SocialAppCubit.get(context).Currentindex],
        );
      },

    );
  }
}
