import 'package:final_project/recipe_description/container_notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/RandomRecipeResponse.dart';
import '../theming.dart';

class RecipeContainer extends StatelessWidget{
  Recipes? args;

  RecipeContainer( {required this.args});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: [
          ContainerNotes(args: args, title1: '${args?.readyInMinutes} min', title2: 'Ready in',),
          Container(
            height: 40,
            width: 3,
            decoration: BoxDecoration(
                color: Theming.primary,
                borderRadius:
                BorderRadius.circular(10.0)),
          ),
          ContainerNotes(args: args, title1: '${args?.servings} ', title2: 'Servings',),
          Container(
            height: 40,
            width: 3,
            decoration: BoxDecoration(
                color: Theming.primary,
                borderRadius:
                BorderRadius.circular(10.0)),
          ),
          ContainerNotes(args: args, title1: '${args?.pricePerServing} ', title2: 'Price/Serving',),
        ],
      ),
    );
  }

}