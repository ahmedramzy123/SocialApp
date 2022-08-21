import 'package:flutter/material.dart';

class bottomPostScreen extends StatelessWidget {
final Function() method;
final IconData icon;
final String name;
bottomPostScreen(this.method, this.icon, this.name);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: method,
      child: Container(
        child: Row(
          children: [
            Icon(icon,color: Colors.blueAccent,),
            SizedBox(width: 5,),
            Text(name,style: TextStyle(color: Colors.blueAccent),),
          ],
        ),
      ),
    );
  }
}
