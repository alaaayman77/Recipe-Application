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
  int? id;
   RecipeImage({super.key,required this.id,required this.dim});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      // clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(20.0),
      child:
        // Stack(
        // alignment: Alignment.topRight,
        // children: [
          CachedNetworkImage(
            height: MediaQuery.sizeOf(context).height * 0.15,
        width: MediaQuery.sizeOf(context).width * 0.48,

        imageUrl:
              "https://spoonacular.com/recipeImages/$id-$dim.jpg",
              placeholder: (context, url) =>
              const ImageLoading(),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
        // ],
      // ),
    );
  }
}
