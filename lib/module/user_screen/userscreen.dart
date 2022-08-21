import 'package:flutter/material.dart';
import 'package:socialapp/cubit/cubits/SocialAppCubit.dart';
import 'package:status_view/status_view.dart';


class StatusScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          StatusView(
            radius: 40,
            spacing: 15,
            strokeWidth: 2,
            indexOfSeenStatus: 3,
            numberOfStatus: 1,
            padding: 4,
            centerImageUrl: "https://img.freepik.com/free-psd/eid-al-adha-mubarak-islamic-festival-social-media-banner-template_106176-1046.jpg?w=740&t=st=1660929649~exp=1660930249~hmac=e9f904af437543adf03ffa3ac4a23a3aef0dfb9169c2502ded74f7a763b57ff5",
            seenColor: Colors.grey,
            unSeenColor: Colors.red,


          ),
        ],
      )
    );
  }
}
