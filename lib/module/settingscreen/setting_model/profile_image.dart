import 'package:flutter/material.dart';

class ProfileImageSetting extends StatelessWidget {
final String image;
ProfileImageSetting(this.image);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage("${image}",

        ),

      ),
    );
  }
}
