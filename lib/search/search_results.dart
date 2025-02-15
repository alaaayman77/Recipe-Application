import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Api/api_manager.dart';
import 'package:final_project/error_model/error_item.dart';
import 'package:final_project/home_page/recipe_image.dart';
import 'package:final_project/home_page/save_item.dart';
import 'package:final_project/loading_effect/homeLoading.dart';
import 'package:final_project/loading_effect/image_loading.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:final_project/model/SearchRecipe.dart';
import 'package:final_project/theming.dart';
import 'package:flutter/material.dart';

import '../recipe_description/recipe_details.dart';

class SearchResults extends StatefulWidget {
  String query;
  SearchResults({required this.query});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchRecipe?>(
        future: ApiManager.getSearchRecipe(query: widget.query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 5),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding:  EdgeInsets.all(10.0),
                child: HomeLoading(),
              ),
            );

            //   I have error
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorItem(
                errormessage: "something went wrong",
                error: () {
                  ApiManager.getSearchRecipe();
                  setState(() {});
                },
              ),
            );
          }

          // Error from API
          if (snapshot.data?.status == 'failure') {
            return Center(
              child: ErrorItem(
                errormessage: snapshot.data?.message,
                error: () {
                  ApiManager.getSearchRecipe();
                  setState(() {});
                },
              ),
            );
          }
          var recipes = snapshot.data?.results;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 5),
                itemCount: recipes!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: ()async{
                      var recipeDetails = await ApiManager.getRandomRecipe();
                      var item = recipeDetails!.recipes?[index];
                      var mappedList =recipes.map((result) => Recipes(
                          id: result.id,
                          title: result.title,
                          image:result.image,
                          readyInMinutes: item?.readyInMinutes,
                          servings: item?.servings,
                          pricePerServing: item?.pricePerServing,
                          extendedIngredients: item?.extendedIngredients,
                          analyzedInstructions: item?.analyzedInstructions,
                          summary: item?.summary,
                          dishTypes: item?.dishTypes
                      )).toList();
                      Navigator.of(context).pushNamed(RecipeDetails.routeName ,arguments :mappedList[index]);
                    } ,
                    child: Row(
                      children: [
                        // Spacer(),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            RecipeImage(id:  recipes[index].id, dim:'636x393' ),
                            // Container(
                            //   child:
                            //   CachedNetworkImage(
                            //     imageUrl:
                            //         "https://spoonacular.com/recipeImages/${recipes[index].id}-636x393.jpg",
                            //     height: MediaQuery.sizeOf(context).height * 0.17,
                            //     width: MediaQuery.sizeOf(context).width * 0.48,
                            //     fit: BoxFit.cover,
                            //     placeholder: (context, url) => ImageLoading(),
                            //     errorWidget: (context, url, error) =>
                            //         Icon(Icons.error),
                            //   ),
                            //   clipBehavior: Clip.antiAlias,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20)),
                            //   height: MediaQuery.sizeOf(context).height * 0.17,
                            //   width: MediaQuery.sizeOf(context).width * 0.48,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child:saveItem(recipe:recipes[index]),
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: 100,
                            height: 60,
                            child: Text(
                              overflow:TextOverflow.clip,
                              recipes[index].title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Theming.deepBlue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
