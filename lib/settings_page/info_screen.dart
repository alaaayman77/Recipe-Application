import 'package:final_project/settings_page/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_content.dart';
class InfoScreen extends StatelessWidget{
  String? content;
  InfoScreen({required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop(SettingsPage.routeName);
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Text(content??''),
              )

          ],
        ),
      ),
    );
  }

}