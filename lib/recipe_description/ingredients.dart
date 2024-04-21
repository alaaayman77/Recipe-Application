import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theming.dart';


class Ingredient extends StatelessWidget{
  String? title;
  List<dynamic>? ingredients;

  Ingredient({required this.title , required this.ingredients });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title??'' , style:Theme.of(context).textTheme.titleMedium),
        if (ingredients != null)
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ingredients?.length,
              itemBuilder: (context, index) {
                var listItem = ingredients?[index];
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start
                    ,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      SizedBox(width: 4),
                      Expanded(child: Text('${listItem.amount} ${listItem.unit} ${listItem.image} ${listItem.name}' ,  style: Theme.of(context).textTheme.bodyMedium , softWrap : true)),
                    ],
                  ),
                );
              }),
        Divider(
          thickness: 0.5,
          color: Theming.deepBlue,
        ),
      ],
    );
  }

}

