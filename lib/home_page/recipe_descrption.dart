import 'package:final_project/model/RandomRecipeResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDescrption extends StatelessWidget {
  Recipes? recipe;

  RecipeDescrption({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Spacer(),
                 SizedBox(
                   width: 120.0,
                   child: Text(
                    softWrap: false,
                    recipe?.title ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                ),
                 ),
              // const Spacer(),
              Text(
                "Ready in ${recipe?.readyInMinutes} mins",
              style: Theme.of(context).textTheme.bodySmall,
              ),
              // const Spacer(flex: 2,),
                ],
    );
  }
}
