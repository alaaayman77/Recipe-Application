import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/RandomRecipeResponse.dart';

class ContainerNotes extends StatelessWidget{
  Recipes? args;
  String? title1;
  String? title2;
  ContainerNotes({required this.args ,required this.title1 , required this.title2});
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(title1??'',
            style: Theme.of(context).textTheme.bodyMedium,),
          Text(title2??'',
            style: Theme.of(context).textTheme.bodyMedium,),
        ]);
  }

}