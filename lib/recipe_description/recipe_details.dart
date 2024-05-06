import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/recipe_description/dragabbleSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home_page/save_item.dart';
import '../model/RandomRecipeResponse.dart';



class RecipeDetails extends StatelessWidget {

  static const routeName = "RecipeDetails";
  Recipes? args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Recipes;
    List<dynamic>? ingredients = args?.extendedIngredients;
    List<dynamic>? instructions = args?.analyzedInstructions;

    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://spoonacular.com/recipeImages/${args?.id}-636x393.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.4, // 1st quarter of the screen height
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(28),
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white
                        .withOpacity(0.5),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: saveItem(recipe:args),
              ),
            ],
          ),

          DragabbleSheet(args: args, ingredients: ingredients, instructions: instructions )
        ],
      ),
    );
  }



}
