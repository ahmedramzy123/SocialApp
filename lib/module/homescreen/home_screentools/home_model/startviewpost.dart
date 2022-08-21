import 'package:flutter/material.dart';
import 'package:socialapp/model/model_user/model_post.dart';

class StartViewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children:[
              CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/dark-blue-wall-with-decorative-stucco-smoke-smog-spotlight_183410-64.jpg?w=826")
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Ahmed Ramzy ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.check_circle,
                        color: Colors.blueAccent,
                        size: 18,
                      ),
                    ],
                  ),
                  Text("january 21,2021 at 11:00 pm ",style: Theme.of(context).textTheme.caption ,),
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))


            ],
          ),
          SizedBox(height: 10,),
          Container(
              height: 100,
              child: Text("Firestore is a flexible, scalable NoSQL cloud database to store and sync data. It keeps your data in sync across client apps through realtime listeners and offers offline support so you can build responsive apps that work regardless of network latency or Internet connectivity.")),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                image: DecorationImage(
                    image: NetworkImage("https://img.freepik.com/free-vector/gradient-sql-illustration_23-2149247491.jpg?w=900&t=st=1659299132~exp=1659299732~hmac=0463b784b31a470ea359f06937e0c845e6873ebce1becefa759b2024652e7be0"),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 2,
            color: Colors.grey[400],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.favorite_border,size: 25,),
              Text("120",style: TextStyle(fontSize: 20),),
              Spacer(),
              Icon(Icons.comment,size: 25,),
              Text("120",style: TextStyle(fontSize: 20),),
            ],
          )
        ],
      ),
    );
  }
}
