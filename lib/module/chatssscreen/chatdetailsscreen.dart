import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:socialapp/cubit/states/SocialAppState.dart';
import 'package:socialapp/model/model_user/model_user.dart';
import 'package:socialapp/module/chatssscreen/splitscreen/receiveruser.dart';
import 'package:socialapp/module/chatssscreen/splitscreen/senderuser.dart';

class ChatDetailsScreen extends StatelessWidget {
ModelUser model;
ChatDetailsScreen(this.model);
TextEditingController text =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context)
    {
      SocialAppCubit.get(context).getChat(receiverId: model.uid as String);
      return BlocConsumer<SocialAppCubit,SocialAppStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Colors.black,
              titleSpacing: 0.0,
              title:  Row(

                children: [

                  CircleAvatar(

                    radius: 20,

                    backgroundImage: NetworkImage("${model.image}"),



                  ),

                  SizedBox(width: 5,),

                  Text("${model.name}",style: TextStyle(fontSize: 20),)

                ],

              ),
            ),
            body: ConditionalBuilder(
              condition: SocialAppCubit.get(context).messages.length > 0,
              builder: (context)=>Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)
                          {
                            var message = SocialAppCubit.get(context).messages[index];
                            if(message.senderId==SocialAppCubit.get(context).user!.uid)
                              SenderUser(message);
                            return RecevierUser(message);
                          },
                          separatorBuilder: (context,index)=>SizedBox(
                            height: 15.0,
                          ),
                          itemCount: SocialAppCubit.get(context).messages.length),
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15),
                          border: Border.all(
                              width: 1,
                              color: Colors.grey
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                controller: text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "type your message here ...",

                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.blue,
                            height: 50,
                            child: MaterialButton(
                              onPressed: ()
                              {
                                SocialAppCubit.get(context).sentChat(
                                    receiverId: model.uid as String,
                                    dateTime: DateTime.now().toString(),
                                    text: text.text);
                              },
                              minWidth: 1,
                              child: Icon(Icons.send,size: 16,color: Colors.white,),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            )
          );
        },
      );
    },

    );
  }
}
