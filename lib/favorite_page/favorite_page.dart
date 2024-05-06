import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/home_page/recipe_info.dart';
import 'package:final_project/home_page/recipe_image.dart';
import 'package:final_project/home_page/save_item.dart';
import 'package:final_project/model/myUser.dart';
import 'package:final_project/provider/Auth_Provider.dart';
import 'package:final_project/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../recipe_description/recipe_details.dart';

class FavoritePage extends StatefulWidget {
    static const routeName = "FavoritePage";

    FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments)as Map;

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
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(RecipeDetails.routeName , arguments: provider.recipes[index]);
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    RecipeImage(id: provider.recipes[index].id,dim: "312x231"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: saveItem(recipe: provider.recipes[index]),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                RecipeInfo(recipe: provider.recipes[index]),
                              ],
                            ),
                        );
                      }),
               ),
           ],
         ),
       );

  }


}
