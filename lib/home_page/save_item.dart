import 'package:flutter/material.dart';

class saveItem extends StatelessWidget {
  const saveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          // color: const Color.fromRGBO(0, 0, 0, 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: IconButton(
          onPressed: (){

          },
          icon:Icon(Icons.favorite_border_rounded),
          color: Colors.black,)),
      );
  }
}
