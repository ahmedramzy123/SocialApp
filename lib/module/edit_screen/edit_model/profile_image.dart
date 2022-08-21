import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
final Function() method;
final ImageProvider imageProvider;
ProfileImage(this.method, this.imageProvider, );
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: imageProvider,
            ),

          ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              radius:15,
              child: IconButton(onPressed:method, icon: Icon(Icons.camera_alt,size: 15,))),
        )


      ],
    );
  }
}
