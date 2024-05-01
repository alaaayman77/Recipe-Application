import 'package:flutter/material.dart';

class AlertDialogModel extends StatelessWidget {

  String? title;
  String? content;
  String? button1;
  String? button2;
 void Function()? onPressedButton1;
  void Function()? onPressedButton2;

   AlertDialogModel({required this.title,required this.content,
     required this.button1 , required this.button2,
     required this.onPressedButton1 , required this.onPressedButton2
     });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? ''),
      content: Text(content?? ''),
      actions: <Widget>[
        TextButton(
          onPressed:onPressedButton1,
          child: Text(button1??''),
        ),
        TextButton(
          onPressed:onPressedButton2,
          child: Text(button2??''),
        ),
      ],
    );
  }
}
