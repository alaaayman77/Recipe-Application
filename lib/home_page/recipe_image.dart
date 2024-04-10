import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/home_page/save_item.dart';
import 'package:final_project/loading_effect/image_loading.dart';
import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  //dim 90x90
  // 240x150
  // 312x150
  // 312x231
  // 480x360
  // 556x370
  // 636x393
  String? dim;
  Recipes? recipe;
   RecipeImage({super.key,required this.recipe,required this.dim});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            CachedNetworkImage(
                imageUrl:
                "https://spoonacular.com/recipeImages/${recipe?.id}-$dim.jpg",
                placeholder: (context, url) =>
                const ImageLoading(),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: saveItem(recipe:recipe),
            ),
          ],
        ),
      ),
    );
  }
}
