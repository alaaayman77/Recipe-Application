import 'package:flutter/cupertino.dart';

class InfoContent extends StatelessWidget{
  String? content;
  InfoContent({required this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(content??''),
    );
  }

}