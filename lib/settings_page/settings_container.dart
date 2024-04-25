import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theming.dart';

class SettingsContainer extends StatelessWidget{
  String? title;
  Function()? openBottomSheet;
  SettingsContainer({required this.title , required this.openBottomSheet});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          margin: EdgeInsets.all(18.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theming.primary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title??'',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              IconButton(icon:Icon(Icons.arrow_drop_down , color: Colors.white,), onPressed: openBottomSheet

              )
            ],
          )),
    );
  }

}