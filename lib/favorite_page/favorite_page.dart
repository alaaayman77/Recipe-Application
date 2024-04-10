import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/home_page/recipe_descrption.dart';
import 'package:final_project/home_page/recipe_image.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:final_project/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
    static const routeName = "FavoritePage";

    FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoriteProvider>(context);
    if(provider.recipes.isEmpty)
      {
        provider.getRecipesFromFireStore();
      }
    return
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             SafeArea(child: Text("Your Favorite Recipe!",style: Theme.of(context).textTheme.titleLarge,)),
             Expanded(
               child: ListView.separated(
                  separatorBuilder: (context,index)=> const Divider(thickness: 3,),
                    itemCount: provider.recipes.length,
                    itemBuilder: (context, index) {
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RecipeImage(recipe: provider.recipes[index],dim: "312x231"),
                            const SizedBox(width: 20),
                            RecipeDescrption(recipe: provider.recipes[index]),
                          ],
                        );
                    }),
             ),
           ],
         ),
       );

  }


}
