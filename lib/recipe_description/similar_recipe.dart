import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Api/api_manager.dart';
import 'package:final_project/home_page/recipe_image.dart';
import 'package:final_project/loading_effect/similar_loading.dart';
import 'package:final_project/model/SimilarRecipeResponse.dart';
import 'package:final_project/recipe_description/recipe_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../error_model/error_item.dart';
import '../loading_effect/homeLoading.dart';
import '../loading_effect/image_loading.dart';
import '../model/RandomRecipeResponse.dart';



class SimilarRecipe extends StatefulWidget{
  Recipes? args;
  @override
  State<SimilarRecipe> createState() => _SimilarRecipeState();
  SimilarRecipe({required this.args});
}

class _SimilarRecipeState extends State<SimilarRecipe> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SimilarList?>(
        future:ApiManager.getSimilarRecipe(widget.args?.id ) ,
        builder: (context , snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) =>  SimilarLoading(),
               gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: ErrorItem(errormessage: "something went wrong",error: (){
                ApiManager.getSimilarRecipe(widget.args?.id);
                setState(() {
                });
              },),
            );
          }
          if (snapshot.data?.status == 'failure') {
            return Center(
              child:  ErrorItem(errormessage:snapshot.data?.message,error: (){
                ApiManager.getSimilarRecipe(widget.args?.id);
                setState(() {
                });
              }, ),
            );

          }
          var similarRecipes = snapshot.data?.list;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                  height:MediaQuery.of(context).size.height*0.26,
                    width:MediaQuery.of(context).size.width,
                  child:ListView.builder(
                    itemCount:similarRecipes!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context ,index ) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: ()async{

                          var recipeDetails = await ApiManager.getRandomRecipe();
                          var item = recipeDetails!.recipes?[index];
                          var mappedList =similarRecipes.map((similar) => Recipes(
                            id: similar.id ,
                            title: similar.name,
                            image:similar.image,
                            readyInMinutes: similar.readyInMinutes,
                            servings: similar.servings,
                            pricePerServing: item?.pricePerServing,
                            extendedIngredients: item?.extendedIngredients,
                            analyzedInstructions: item?.analyzedInstructions,
                            summary: item?.summary,
                            dishTypes: item?.dishTypes
                          )).toList();
                          Navigator.of(context).pushNamed(RecipeDetails.routeName ,arguments :mappedList[index]);
                        },
                        child:
                           Container(
                          
                            height:MediaQuery.of(context).size.height*0.5,
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Column(
                              children: [
                                RecipeImage(id: similarRecipes[index].id, dim: "636x393"),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(20),
                                //   child: CachedNetworkImage(
                                //     imageUrl:
                                //     "https://spoonacular.com/recipeImages/${similarRecipes[index]?.id}-636x393.jpg",
                                //    fit: BoxFit.fill,
                                //     placeholder: (context, url) =>
                                //     const ImageLoading(),
                                //     errorWidget: (context, url, error) =>
                                //     const Icon(Icons.error),
                                //   ),
                                // ),
                              Expanded(
                                child: Text('${similarRecipes[index].name}' ,
                                  softWrap: false,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,),
                              )
                            ],
                            ),

                        ),
                      ),
                    ),) ,
                )],

              ),
            ),
          );

        });
  }

}