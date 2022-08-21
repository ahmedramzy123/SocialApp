import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final Function() method;
  CoverImage(this.method, this.imageProvider,);
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        alignment:AlignmentDirectional.bottomEnd,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5.0),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover
                )
            ),
          ),
          CircleAvatar(
              radius:20,
              child: IconButton(onPressed:method, icon: Icon(Icons.camera_alt,)))
        ],
      ),
    );
  }
}
