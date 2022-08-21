import 'package:flutter/material.dart';

class CoverImageSetting extends StatelessWidget {
  final String image;
  CoverImageSetting(this.image);
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(5.0),
            image: DecorationImage(
                image: NetworkImage("${image}"),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}
